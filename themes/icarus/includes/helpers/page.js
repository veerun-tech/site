/**
* Helper functions for page/post.
*
* @example
*     <%- is_categories(page) %>
*     <%- is_tags(page) %>
*     <%- page_title(page) %>
*     <%- meta(post) %>
*     <%- has_thumbnail(post) %>
*     <%- get_thumbnail(post) %>
*/
module.exports = function (hexo) {
    function trim(str) {
        return str.trim().replace(/^"(.*)"$/, '$1').replace(/^'(.*)'$/, '$1');
    }

    function split(str, sep) {
        var result = [];
        var matched = null;
        while (matched = sep.exec(str)) {
            result.push(matched[0]);
        }
        return result;
    }

    hexo.extend.helper.register('is_categories', function (page = null) {
        return (page === null ? this.page : page).__categories;
    });

    hexo.extend.helper.register('is_tags', function (page = null) {
        return (page === null ? this.page : page).__tags;
    });

    /**
     * Generate html head title based on page type
     */
    hexo.extend.helper.register('page_title', function (page = null) {
        page = page === null ? this.page : page;
        let title = page.title;

        if (this.is_archive()) {
            title = this._p('common.archive', Infinity);
            if (this.is_month()) {
                title += ': ' + page.year + '/' + page.month;
            } else if (this.is_year()) {
                title += ': ' + page.year;
            }
        } else if (this.is_category()) {
            title = this._p('common.category', 1) + ': ' + page.category;
        } else if (this.is_tag()) {
            title = this._p('common.tag', 1) + ': ' + page.tag;
        } else if (this.is_categories()) {
            title = this._p('common.category', Infinity);
        } else if (this.is_tags()) {
            title = this._p('common.tag', Infinity);
        }

        const siteTitle = hexo.extend.helper.get('get_config').bind(this)('title', '', true);
        return [title, siteTitle].filter(str => typeof (str) !== 'undefined' && str.trim() !== '').join(' - ');
    });

    hexo.extend.helper.register('meta', function (post) {
        var metas = post.meta || [];
        var output = '';
        var metaDOMArray = metas.map(function (meta) {
            var entities = split(meta, /(?:[^\\;]+|\\.)+/g);
            var entityArray = entities.map(function (entity) {
                var keyValue = split(entity, /(?:[^\\=]+|\\.)+/g);
                if (keyValue.length < 2) {
                    return null;
                }
                var key = trim(keyValue[0]);
                var value = trim(keyValue[1]);
                return key + '="' + value + '"';
            }).filter(function (entity) {
                return entity;
            });
            return '<meta ' + entityArray.join(' ') + ' />';
        });
        return metaDOMArray.join('\n');
    });

    hexo.extend.helper.register('has_thumbnail', function (post) {
        const getConfig = hexo.extend.helper.get('get_config').bind(this);
        const allowThumbnail = getConfig('article.thumbnail', true);
        if (!allowThumbnail) {
            return false;
        }
        return post.hasOwnProperty('thumbnail') && post.thumbnail;
    });

    hexo.extend.helper.register('get_thumbnail', function (post) {
        const hasThumbnail = hexo.extend.helper.get('has_thumbnail').bind(this)(post);
        return this.url_for(hasThumbnail ? post.thumbnail : 'images/thumbnail.svg');
    });

    hexo.extend.helper.register('get_author_link', function (post) {
        const author = hexo.extend.helper.get('get_author').bind(this)(post);
        let link = author.name;
        if (author.url) {
            link = this.link_to(author.url, author.name, {external: true});
        } else if (author.email) {
            link = this.mail_to(author.email, author.name);
        }
        return link;
    });

    hexo.extend.helper.register('get_author', function (post) {
        const config = Object.assign({}, this.config, hexo.theme.config);
        let author = {};
        if (post.author) {
            if (typeof(post.author) === 'string') {
                let matches = /^(.+?)(\s*<(.+)>)?$/.exec(post.author);

                author.name = matches[1];
                if (/^http(s)?/.test(matches[3])) {
                    author.url = matches[3];
                } else {
                    author.email = matches[3];
                }
            } else {
                author = post.author;
            }
        } else {
            author = {name: config.author, email: config.email};
        }
        return author;
    });
}
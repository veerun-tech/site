#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

urls=(
'https://fonts.googleapis.com/css?family=Ubuntu:400,600|Source+Code+Pro font.css'
'https://fonts.gstatic.com/s/sourcecodepro/v8/HI_SiYsKILxRpg3hIP6sJ7fM7PqlM-vWjMY.woff2'
'https://fonts.gstatic.com/s/sourcecodepro/v8/HI_SiYsKILxRpg3hIP6sJ7fM7PqlPevW.woff2'
'https://fonts.gstatic.com/s/ubuntu/v12/4iCs6KVjbNBYlgoKcg72j00.woff2'
'https://fonts.gstatic.com/s/ubuntu/v12/4iCs6KVjbNBYlgoKew72j00.woff2'
'https://fonts.gstatic.com/s/ubuntu/v12/4iCs6KVjbNBYlgoKcw72j00.woff2'
'https://fonts.gstatic.com/s/ubuntu/v12/4iCs6KVjbNBYlgoKfA72j00.woff2'
'https://fonts.gstatic.com/s/ubuntu/v12/4iCs6KVjbNBYlgoKcQ72j00.woff2'
'https://fonts.gstatic.com/s/ubuntu/v12/4iCs6KVjbNBYlgoKfw72.woff2'
'https://use.fontawesome.com/releases/v5.4.1/css/all.css'
'https://use.fontawesome.com/releases/v5.4.1/webfonts/fa-brands-400.woff2'
'https://use.fontawesome.com/releases/v5.4.1/webfonts/fa-solid-900.woff2'
'https://cdn.jsdelivr.net/npm/bulma@0.7.2/css/bulma.css'
'https://cdn.jsdelivr.net/npm/bulma@0.7.2/css/bulma.css.map'
'https://cdn.jsdelivr.net/npm/pace-js@1.0.2/pace.min.js'
'https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js'
'https://cdn.jsdelivr.net/npm/moment@2.22.2/min/moment-with-locales.min.js'
'https://cdn.jsdelivr.net/npm/highlight.js@9.12.0/styles/solarized-dark.min.css'
'https://cdn.jsdelivr.net/npm/lightgallery@1.6.8/dist/css/lightgallery.min.css'
'https://cdn.jsdelivr.net/npm/lightgallery@1.6.8/dist/js/lightgallery.min.js'
'https://cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/css/justifiedGallery.min.css'
'https://cdn.jsdelivr.net/npm/justifiedGallery@3.7.0/dist/js/jquery.justifiedGallery.min.js'
'https://cdn.jsdelivr.net/npm/outdatedbrowser@1.1.5/outdatedbrowser/outdatedbrowser.min.css'
'https://cdn.jsdelivr.net/npm/outdatedbrowser@1.1.5/outdatedbrowser/outdatedbrowser.min.js'
'https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/css/share.min.css'
'https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/js/social-share.min.js'
'https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/fonts/iconfont.woff'
'https://cdn.jsdelivr.net/npm/social-share.js@1.0.16/dist/fonts/iconfont.ttf'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/MathJax.js?config=TeX-MML-AM_CHTML'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/config/TeX-MML-AM_CHTML.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/jax/input/TeX/config.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/jax/input/MathML/config.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/jax/input/AsciiMath/config.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/jax/output/CommonHTML/config.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/jax/output/PreviewHTML/config.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/tex2jax.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/mml2jax.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/asciimath2jax.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/MathEvents.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/MathZoom.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/MathMenu.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/toMathML.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/TeX/noErrors.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/TeX/noUndefined.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/TeX/AMSmath.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/TeX/AMSsymbols.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/fast-preview.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/AssistiveMML.js?V=2.7.5'
'https://cdn.jsdelivr.net/npm/mathjax@2.7.5/unpacked/extensions/a11y/accessibility-menu.js?V=2.7.5'
)

thirdparty_dir="${DIR}/source/thirdparty"
for url in "${urls[@]}"; do
    # https://stackoverflow.com/questions/6174220/parse-url-in-shell-script#answer-6174447
    proto=$(echo $url | grep :// | sed -e 's,^\(.*\)://.*,\1,g')
    resource_alias=$(echo $url | awk -F' ' '{print $2}')
    uri=$(echo $url | awk -F' ' '{print $1}' | sed -e "s,^$proto://,,g" | sed -e 's,\?.*,,g')
    # details in 'includes/helpers/cdn.js'
    uri=$(echo $uri | sed -E 's,/(unpacked|dist|min|outdatedbrowser)/,/,g' | sed -e 's,/pace-js@,/pace@,g; s,/outdatedbrowser@,/outdated-browser@,g; s,/moment@,/moment.js@,g')
    resource=$(basename $uri)
    resource_dir="${thirdparty_dir}/$(dirname $uri)"

    if [ -n "${resource_alias}" ]; then
        resource="${resource_alias}"
    fi
    if [ -e "${resource_dir}/${resource}" ]; then
        echo "[IGNORE] ${url}: fetched already!"
        continue
    fi
    echo "Fetching resource from ${url} ..."
    mkdir -p "${resource_dir}"
    wget -O "${resource_dir}/${resource}" "${url}"
done

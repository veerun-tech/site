[Veerun Tech's Website](https://veerun-tech.github.io)
========================================================
<!--
- 主题可以使用 https://github.com/carlos-algms/hexo-theme-materialize ，其提供的主页与Blog是分离的
-->

> The source code is [here](https://github.com/veerun-tech/website).

## Usage

### Start local service

```bash
$ npm run dev

# With debug mode
$ npm run debug
```

### Build publish files

```bash
# The publish files will be put to the directory 'dist'
$ npm run build

# Clean
$ npm run clean
```

### Create new post

```bash
$ npm run create post <title>

# Create tags/categories page
## https://github.com/iissnan/hexo-theme-next/issues/51
## First create pages, then add line:
### `type: tags` or `type: categories` to tags/index.md or categories/index.md
$ npm run create page tags
$ npm run create page categories
```

### Deploy to github

```bash
$ npm run deploy
```

## About Us

```java
// TODO
```

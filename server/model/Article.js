/**
 * Created by hyt on 2017/3/10.
 */
function filterHTML (html) {
    html = html.replace(/<\/?[^>]*>/g,''); //去除HTML tag
    html = html.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
    html = html.replace(/ /ig,'');//去掉
    return html;
}
function Article (article) {
    this.title = article.title;
    this.date = article.date || new Date();
    this.detail = article.detail;
    this.author = article.author;
    if (article.desc) {
        this.desc = article.desc;
    } else {
        this.desc = filterHTML(article.detail || '').substr(0,200);
    }
}

module.exports = Article;
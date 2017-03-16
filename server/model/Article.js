/**
 * Created by hyt on 2017/3/10.
 */
function Article (article) {
    this.id = article.id;
    this.title = article.title;
    this.date = article.date || new Date();
    this.desc = article.desc;
    this.detail = article.detail;
    this.tags = article.tags;
    this.author = article.author;
}

module.exports = Article;
/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-23 17:32:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '文章id\r\n',
  `title` varchar(100) DEFAULT '',
  `date` datetime DEFAULT NULL,
  `desc` varchar(125) DEFAULT NULL,
  `detail` text,
  `author` varchar(20) DEFAULT '匿名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `date` (`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2991 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '测试文章', '2017-03-23 15:06:15', '啊实打实对安徽省就考官很坑待会解答卡士大夫加快速度浩丰科技阿萨德', '啊实打实的害死打飞机开股东会会计法哈就开始道具卡山东矿机设定高度加框架安居客了圣诞节卢卡斯的', '匿名');
INSERT INTO `article` VALUES ('2', '测试数据1', '2017-03-23 08:54:15', '测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据111111测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('3', '测试数据2', '2017-03-23 08:54:46', '测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222', '测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222测试数据测试数据测试数据22222试数据测试数据22222测试数据测试数据测试数据22222', '唐正');
INSERT INTO `article` VALUES ('4', '测试数据4', '2017-03-23 09:02:51', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('5', '测试数据5', '2017-03-23 09:03:10', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('6', '测试数据6', '2017-03-23 09:03:15', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('7', '测试数据7', '2017-03-23 09:03:21', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('8', '测试数据8', '2017-03-23 09:03:26', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('9', '测试数据9', '2017-03-23 09:03:37', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('10', '测试数据10', '2017-03-23 09:03:45', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('11', '测试数据11', '2017-03-23 09:03:49', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('12', '测试数据12', '2017-03-23 09:03:53', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('13', '测试数据13', '2017-03-23 09:03:58', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据', '唐正');
INSERT INTO `article` VALUES ('2990', 'markdown基本语法教程', '2017-03-23 08:52:36', 'markdown基本语法教程markdown基本语法教程markdown基本语法教程markdown基本语法教程markdown基本语法教程markdown基本语法教程markdown基本语法教程markdown基本语法教程', '  <h2 class=\"article-title\">markdown基本语法教程</h2>\r\n                <p class=\"article-date\">\r\n                    <span>作者: <em>tony</em></span>\r\n                    <span>日期: <em>2017-03-08</em></span>\r\n                </p>\r\n                <section class=\"markdown-body\">\r\n                    <h2>主要内容</h2>\r\n                    <blockquote>\r\n                        <h4>Markdown是<em>什么</em>？</h4>\r\n                        <h4><em>谁</em>发明了这么个东西？</h4>\r\n                        <h4><em>为什么</em>要使用它？</h4>\r\n                        <h4><em>怎么</em>使用？</h4>\r\n                        <h4>都<em>谁</em>在用？</h4>\r\n                        <h4>感觉有意思？<em>不怕你看见，就怕你试试</em></h4>\r\n                    </blockquote>\r\n                    <h2>正文</h2>\r\n                    <h3>1. Markdown是<em>什么</em>？</h3>\r\n                    <p><strong>Markdown</strong>是一种轻量级<strong>标记语言</strong>，它以纯文本形式(<em>易读、易写、易更改</em>)编写文档，并最终以HTML格式发布。 <br>\r\n                        <strong>Markdown</strong>也可以理解为将以MARKDOWN语言编写的语言转换成HTML内容的工具，最初是一个perl脚本<em>Markdown.pl</em>。    </p>\r\n                    <h3>2. <em>谁</em>发明了这么个东西？</h3>\r\n                    <p>它由<a href=\"http://www.aaronsw.com/\"><strong>Aaron Swartz</strong></a>和<strong>John Gruber</strong>共同设计，<strong>Aaron Swartz</strong>就是那位于去年（<em>2013年1月11日</em>）自杀,有着<strong>开挂</strong>一般人生经历的程序员。维基百科对他的<a href=\"http://zh.wikipedia.org/wiki/%E4%BA%9A%E4%BC%A6%C2%B7%E6%96%AF%E6%B2%83%E8%8C%A8\">介绍</a>是：<strong>软件工程师、作家、政治组织者、互联网活动家、维基百科人</strong>。    </p>\r\n                    <p>他有着足以让你跪拜的人生经历： <br>\r\n                        + <strong>14岁</strong>参与RSS 1.0规格标准的制订。 <br>\r\n                        + <strong>2004</strong>年入读<strong>斯坦福</strong>，之后退学。 <br>\r\n                        + <strong>2005</strong>年创建<a href=\"http://infogami.org/\">Infogami</a>，之后与<a href=\"http://www.reddit.com/\">Reddit</a>合并成为其合伙人。 <br>\r\n                        + <strong>2010</strong>年创立求进会（Demand Progress），积极参与禁止网络盗版法案（SOPA）活动，最终该提案<strong>居然</strong>被撤回。 <br>\r\n                        + <strong>2011</strong>年7月19日，因被控从MIT和JSTOR下载480万篇学术论文并以免费形式上传于网络被捕。 <br>\r\n                        + <strong>2013</strong>年1月自杀身亡。    </p>\r\n                    <p>天才都有早逝的归途（又是一位<strong>犹太人</strong>）。</p>\r\n                    <h3>3. <em>为什么</em>要使用它？</h3>\r\n                    <ul>\r\n                        <li>它是易读（<em>看起开舒服</em>）、易写（<em>语法简单</em>）、易更改<strong>纯文本</strong>。处处体现着<strong>极简主义</strong>的影子。</li>\r\n                        <li>兼容HTML，可以转换为HTML格式发布。</li>\r\n                        <li>跨平台使用。</li>\r\n                        <li>越来越多的网站支持Markdown。</li>\r\n                        <li>更方便清晰的组织你的电子邮件。（Markdown-here, Airmail）</li>\r\n                        <li>摆脱Word（我不是认真的）。</li>\r\n                    </ul>\r\n                    <h3>4. <em>怎么</em>使用？</h3>\r\n                    <p>如果不算<strong>扩展</strong>，Markdown的语法绝对<strong>简单</strong>到让你爱不释手。</p>\r\n                    <p>废话太多，下面正文，Markdown语法主要分为如下几大部分：\r\n                        <strong>标题</strong>，*<em>段落<strong>，</strong>区块引用<strong>，</strong>代码区块<strong>，</strong>强调<strong>，</strong>列表<strong>，</strong>分割线<strong>，</strong>链接<strong>，</strong>图片<strong>，</strong>反斜杠 <code>\\</code><strong>，</strong>符号\'`\'</em>*。</p>\r\n                    <h4>4.1 标题</h4>\r\n                    <p>两种形式： <br>\r\n                        1）使用<code>=</code>和<code>-</code>标记一级和二级标题。</p>\r\n                    <blockquote>\r\n                        <p>一级标题 <br>\r\n                            <code>=========</code> <br>\r\n                            二级标题 <br>\r\n                            <code>---------</code></p>\r\n                    </blockquote>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <h1>一级标题   </h1>\r\n                        <h2>二级标题</h2>\r\n                    </blockquote>\r\n                    <p>2）使用<code>#</code>，可表示1-6级标题。</p>\r\n                    <blockquote>\r\n                        <p># 一级标题 <br>\r\n                            ## 二级标题 <br>\r\n                            ### 三级标题 <br>\r\n                            #### 四级标题 <br>\r\n                            ##### 五级标题 <br>\r\n                            ###### 六级标题    </p>\r\n                    </blockquote>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <h1>一级标题</h1>\r\n                        <h2>二级标题</h2>\r\n                        <h3>三级标题</h3>\r\n                        <h4>四级标题</h4>\r\n                        <h5>五级标题</h5>\r\n                        <h6>六级标题</h6>\r\n                    </blockquote>\r\n                    <h4>4.2 段落</h4>\r\n                    <p>段落的前后要有空行，所谓的空行是指没有文字内容。若想在段内强制换行的方式是使用<strong>两个以上</strong>空格加上回车（引用中换行省略回车）。</p>\r\n                    <h4>4.3 区块引用</h4>\r\n                    <p>在段落的每行或者只在第一行使用符号<code>&gt;</code>,还可使用多个嵌套引用，如：</p>\r\n                    <blockquote>\r\n                        <p>> 区块引用 <br>\r\n                            >> 嵌套引用  </p>\r\n                    </blockquote>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <p>区块引用  </p>\r\n                        <blockquote>\r\n                            <p>嵌套引用 </p>\r\n                        </blockquote>\r\n                    </blockquote>\r\n                    <h4>4.4 代码区块</h4>\r\n                    <p>代码区块的建立是在每行加上4个空格或者一个制表符（如同写代码一样）。如 <br>\r\n                        普通段落：</p>\r\n                    <p>void main() <br>\r\n                        { <br>\r\n                        printf(\"Hello, Markdown.\"); <br>\r\n                        }    </p>\r\n                    <p>代码区块：</p>\r\n<pre><code>void main()\r\n    {\r\n    printf(\"Hello, Markdown.\");\r\n    }\r\n</code></pre>\r\n                    <p><strong>注意</strong>:需要和普通段落之间存在空行。</p>\r\n                    <h4>4.5 强调</h4>\r\n                    <p>在强调内容两侧分别加上<code>*</code>或者<code>_</code>，如：</p>\r\n                    <blockquote>\r\n                        <p>*斜体*，_斜体_ <br>\r\n                            **粗体**，__粗体__</p>\r\n                    </blockquote>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <p><em>斜体</em>，_斜体_ <br>\r\n                            <strong>粗体</strong>，_<em>粗体</em>_</p>\r\n                    </blockquote>\r\n                    <h4>4.6 列表</h4>\r\n                    <p>使用<code>·</code>、<code>+</code>、或<code>-</code>标记无序列表，如：</p>\r\n                    <blockquote>\r\n                        <p>-（+*） 第一项\r\n                            -（+*） 第二项\r\n                            - （+*）第三项</p>\r\n                    </blockquote>\r\n                    <p><strong>注意</strong>：标记后面最少有一个<em>空格</em>或_制表符_。若不在引用区块中，必须和前方段落之间存在空行。</p>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <ul>\r\n                            <li>第一项</li>\r\n                            <li>第二项</li>\r\n                            <li>第三项</li>\r\n                        </ul>\r\n                    </blockquote>\r\n                    <p>有序列表的标记方式是将上述的符号换成数字,并辅以<code>.</code>，如：</p>\r\n                    <blockquote>\r\n                        <p>1 . 第一项 <br>\r\n                            2 . 第二项 <br>\r\n                            3 . 第三项    </p>\r\n                    </blockquote>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <ol>\r\n                            <li>第一项</li>\r\n                            <li>第二项</li>\r\n                            <li>第三项</li>\r\n                        </ol>\r\n                    </blockquote>\r\n                    <h4>4.7 分割线</h4>\r\n                    <p>分割线最常使用就是三个或以上<code>*</code>，还可以使用<code>-</code>和<code>_</code>。</p>\r\n                    <h4>4.8 链接</h4>\r\n                    <p>链接可以由两种形式生成：<strong>行内式</strong>和*参考式<strong>。 <br>*行内式</strong>：</p>\r\n                    <blockquote>\r\n                        <p>[younghz的Markdown库](https:://github.com/younghz/Markdown \"Markdown\")。</p>\r\n                    </blockquote>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <p><a href=\"https%3a://github.com/younghz/Markdown\" title=\"Markdown\">younghz的Markdown库</a>。</p>\r\n                    </blockquote>\r\n                    <p><strong>参考式</strong>：</p>\r\n                    <blockquote>\r\n                        <p>[younghz的Markdown库1][1] <br>\r\n                            [younghz的Markdown库2][2] <br>\r\n                            [1]:https:://github.com/younghz/Markdown \"Markdown\" <br>\r\n                            [2]:https:://github.com/younghz/Markdown \"Markdown\"    </p>\r\n                    </blockquote>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <p><a href=\"https%3a://github.com/younghz/Markdown\" title=\"Markdown\">younghz的Markdown库1</a> <br>\r\n                            <a href=\"https%3a://github.com/younghz/Markdown\" title=\"Markdown\">younghz的Markdown库2</a></p>\r\n                    </blockquote>\r\n                    <p><strong>注意</strong>：上述的<code>[1]:https:://github.com/younghz/Markdown \"Markdown\"</code>不出现在区块中。</p>\r\n                    <h4>4.9 图片</h4>\r\n                    <p>添加图片的形式和链接相似，只需在链接的基础上前方加一个<code>！</code>。</p>\r\n                    <h4>4.10 反斜杠<code>\\</code></h4>\r\n                    <p>相当于<strong>反转义</strong>作用。使符号成为普通符号。</p>\r\n                    <h4>4.11 符号\'`\'</h4>\r\n                    <p>起到标记作用。如：</p>\r\n                    <blockquote>\r\n                        <p>`ctrl+a`</p>\r\n                    </blockquote>\r\n                    <p>效果：</p>\r\n                    <blockquote>\r\n                        <p><code>ctrl+a</code>    </p>\r\n                    </blockquote>\r\n                    <h4>5. 都<em>谁</em>在用？</h4>\r\n                    <p>Markdown的使用者：\r\n                        + GitHub\r\n                        + 简书\r\n                        + Stack Overflow\r\n                        + Apollo\r\n                        + Moodle\r\n                        + Reddit\r\n                        + 等等</p>\r\n                    <h4>6. 感觉有意思？趁热打铁，推荐几个<em>工具</em>。</h4>\r\n                    <ul>\r\n                        <li><strong>Chrome</strong>下的stackedit插件可以离线使用，很爽。也不用担心平台受限。\r\n                            在线的dillinger.io算是评价好的了，可是不能离线使用。    </li>\r\n                        <li><strong>Windowns</strong>下的MarkdownPad也用过，不过免费版的体验不是很好。    </li>\r\n                        <li><strong>Mac</strong>下的Mou是国人贡献的，口碑很好。推荐。    </li>\r\n                        <li><strong>Linux</strong>下的ReText不错。    </li>\r\n                    </ul>\r\n                    <p><strong>其实在对语法了如于心的话，直接用编辑器就可以了，脑子里满满的都是格式化好的文本啊。</strong>\r\n                        我现在使用<code>马克飞象</code> + <code>Markdown-here</code>，先编辑好，然后一键格式化，挺方便。</p>\r\n                    <hr />\r\n                    <p><strong>注意</strong>：不同的Markdown解释器或工具对相应语法（扩展语法）的解释效果不尽相同，具体可参见工具的使用说明。\r\n                        虽然有人想出面搞一个所谓的标准化的Markdown，[没想到还惹怒了健在的创始人John Gruber]\r\n                        (http://blog.codinghorror.com/standard-markdown-is-now-common-markdown/)。</p>\r\n                    <hr />\r\n                    <p>以上基本是所有traditonal markdown的语法。</p>\r\n                    <h3>其它：</h3>\r\n                    <p>列表的使用(非traditonal markdown)：</p>\r\n                    <p>用<code>|</code>表示表格纵向边界，表头和表内容用<code>-</code>隔开，并可用<code>:</code>进行对齐设置，两边都有<code>:</code>则表示居中，若不加<code>:</code>则默认左对齐。</p>\r\n                    <p>|代码库                              |链接                                |\r\n                        |:------------------------------------:|------------------------------------|\r\n                        |MarkDown                              |<a href=\"https://github.com/younghz/Markdown\" title=\"Markdown\">https://github.com/younghz/Markdown</a>|\r\n                        |moos-young                            |<a href=\"https://github.com/younghz/moos-young\" title=\"tianchi\">https://github.com/younghz/moos-young</a>|</p>\r\n                    <p>关于其它扩展语法可参见具体工具的使用说明。</p>\r\n                </section>', '唐正');

-- ----------------------------
-- Table structure for `article_to_tag`
-- ----------------------------
DROP TABLE IF EXISTS `article_to_tag`;
CREATE TABLE `article_to_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` varchar(20) DEFAULT NULL,
  `t_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_to_tag
-- ----------------------------
INSERT INTO `article_to_tag` VALUES ('1', '2990', '1');
INSERT INTO `article_to_tag` VALUES ('2', '2990', '2');
INSERT INTO `article_to_tag` VALUES ('3', '2990', '3');
INSERT INTO `article_to_tag` VALUES ('5', '13', '4');
INSERT INTO `article_to_tag` VALUES ('6', '2', '4');
INSERT INTO `article_to_tag` VALUES ('7', '3', '4');
INSERT INTO `article_to_tag` VALUES ('8', '4', '4');
INSERT INTO `article_to_tag` VALUES ('9', '5', '4');
INSERT INTO `article_to_tag` VALUES ('10', '6', '4');
INSERT INTO `article_to_tag` VALUES ('11', '7', '4');
INSERT INTO `article_to_tag` VALUES ('12', '8', '4');
INSERT INTO `article_to_tag` VALUES ('13', '9', '4');
INSERT INTO `article_to_tag` VALUES ('14', '10', '4');
INSERT INTO `article_to_tag` VALUES ('15', '11', '4');
INSERT INTO `article_to_tag` VALUES ('16', '12', '4');
INSERT INTO `article_to_tag` VALUES ('18', '1', '4');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `text` text,
  `date` datetime DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `ref_id` varchar(20) DEFAULT NULL COMMENT '回复此条评论',
  `article_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '这篇文章很赞', '2017-03-14 10:51:13', '老张', null, '0', '2990');
INSERT INTO `comment` VALUES ('2', '测试评论数据', '2017-03-14 10:51:17', '老张', null, '0', '2990');
INSERT INTO `comment` VALUES ('3', '测试 测试！！！', '2017-03-14 10:51:19', '老张', null, '0', '2990');
INSERT INTO `comment` VALUES ('4', '是吗？', '2017-03-15 15:18:17', '小唐', null, '1', null);
INSERT INTO `comment` VALUES ('5', '测试评论回复', '2017-03-14 15:39:11', '老汪', null, '1', null);
INSERT INTO `comment` VALUES ('6', '测好的还是等哈就开始打哈加快速度', '2017-03-23 15:49:07', '老周', '123456789@11.com', '', '2990');
INSERT INTO `comment` VALUES ('7', '测好的还是等哈就开始打哈加快速度', '2017-03-23 15:52:27', '老周', '123456789@11.com', null, '2990');
INSERT INTO `comment` VALUES ('8', '测好的还是等哈就开始打哈加快速度', '2017-03-23 16:09:01', '老周1', '123456789@11.com', null, '2990');
INSERT INTO `comment` VALUES ('9', '阿萨1111111111111111111111111111111', '2017-03-23 16:10:01', '老唐', '111111111111111', '2', null);
INSERT INTO `comment` VALUES ('10', '老赵老赵老赵老赵老赵老赵老赵老赵老赵老赵', '2017-03-23 16:13:19', '老赵', '', null, '2990');
INSERT INTO `comment` VALUES ('11', '老爷子写的文章不错！！！', '2017-03-23 16:26:28', '小赵', '', '10', null);
INSERT INTO `comment` VALUES ('12', '11111', '2017-03-23 16:26:50', '拉叶子', '', '10', null);
INSERT INTO `comment` VALUES ('13', '啊实打实的', '2017-03-23 16:28:50', '阿打算', '', '10', null);
INSERT INTO `comment` VALUES ('14', '啊实打实大师大啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2017-03-23 16:31:30', '老蒋', '', null, '1');

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', 'HTML', '1');
INSERT INTO `tag` VALUES ('2', 'CSS', '1');
INSERT INTO `tag` VALUES ('3', 'JavaScript', '1');
INSERT INTO `tag` VALUES ('4', '未分类', '13');

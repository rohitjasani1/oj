<?php
$incl_dir = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'HtmlDom' . DIRECTORY_SEPARATOR;
require_once $incl_dir . 'StringIterator.php';
require_once $incl_dir . 'DomNodeAttribute.php';
require_once $incl_dir . 'HtmlDomComment.php';
require_once $incl_dir . 'HtmlDomSelectorPatternMode.php';
require_once $incl_dir . 'HtmlDomSelectorPatternAttributeValue.php';
require_once $incl_dir . 'HtmlDomSelectorPattern.php';
require_once $incl_dir . 'HtmlDomSelector.php';
require_once $incl_dir . 'HtmlDomNode.php';

class HtmlDom {
    public static function fromURL($url) {
        //try to get the url's content with curl if browser class or file_get_contents fails, also try with the browser class
        $dom = new HtmlDom(file_get_contents($url));
        return $dom->getRoot();
    }

    public static function fromFile($file) {
        $dom = new HtmlDom(file_get_contents($file));
        return $dom->getRoot();
    }

    public static function fromString($string) {
        $dom = new HtmlDom($string);
        return $dom->getRoot();
    }

    private $content;
    private $root;

    public function __construct($content) {
        $this->content = $content;
        $this->root = null;
        $this->buildDom();
    }

    public function getRoot() {
        return $this->root;
    }

    private function buildDom() {
        if (!empty($this->dom)) return;

        $this->root = new HtmlDomNode('', null);
        $this->root->parseDom(new StringIterator($this->content));
    }
}

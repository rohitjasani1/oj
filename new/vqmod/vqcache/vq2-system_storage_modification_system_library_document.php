<?php
class Document {
	private $title;

				private $socialseo;
				
	private $description;
	private $keywords;
	private $links = array();
	private $styles = array();
	private $scripts = array();

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setDescription($description) {
		$this->description = $description;
	}


				public function setSocialSeo($socialseo) {
					$this->socialseo = $socialseo;
				}

				public function getSocialSeo() {
					return $this->socialseo;
				}
				
	public function getDescription() {
		return $this->description;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getKeywords() {
		return $this->keywords;
	}


				public function removeLink($rel) {
					foreach ($this->links as $val=>$link) {
						if ($link['rel'] == $rel) {unset($this->links[$val]);}
					}
				}
			
	public function addLink($href, $rel) {
		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	public function getLinks() {
		return $this->links;
	}

	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	public function getStyles() {

                require_once DIR_SYSTEM . 'nitro/core/core.php';
                require_once NITRO_INCLUDE_FOLDER . 'minify_css.php';

                return nitro_minify_css($this->styles);
            
		return $this->styles;
	}

	public function addScript($href, $postion = 'header') {
		$this->scripts[$postion][$href] = $href;
	}

	public function getScripts($postion = 'header') {
		if (isset($this->scripts[$postion])) {

                require_once DIR_SYSTEM . 'nitro/core/core.php';
                require_once NITRO_INCLUDE_FOLDER . 'minify_js.php';

                return nitro_minify_js($this->scripts[$postion]);
            
			return $this->scripts[$postion];
		} else {
			return array();
		}
	}
}
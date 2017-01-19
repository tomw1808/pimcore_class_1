<?php

namespace Pimcore\Model\Document\Tag\Area;
use Pimcore\Model\Document;

/**
 * Class Blogindex
 * @package Pimcore\Model\Document\Tag\Area
 */
class Blogindex extends Document\Tag\Area\AbstractArea
{
	/**
	 * reuired
	 */
	public function action () {
		$list = new \Pimcore\Model\Object\Blogpost\Listing();

		$paginator = \Zend_Paginator::factory($list);
		$paginator->setCurrentPageNumber( $this->getParam('page') );
		$paginator->setItemCountPerPage(2);
		$this->view->paginator  = $paginator;
	}

	// OPTINAL METHODS
	/**
	 * optional
	 * Executed after a brick is rendered
	 */
	public function postRenderAction(){
		//...
	}

	/**
	 * optional
	 * Returns a custom html wrapper element (return an empty string if you don't want a wrapper element)
	 */
	public function getBrickHtmlTagOpen($brick){
		return '<span class="customWrapperDiv">';
	}

	/**
	 * optional
	 */
	public function getBrickHtmlTagClose($brick){
		return '</span>';
	}
}
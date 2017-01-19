<?php

namespace Pimcore\Model\Document\Tag\Area;
use Pimcore\Model\Document;
use Pimcore\Model\Object\Contacts;

/**
 * Class Contactform
 * @package Pimcore\Model\Document\Tag\Area
 */
class Contactform extends Document\Tag\Area\AbstractArea
{
	/**
	 * reuired
	 */
	public function action () {
		// sending a text-mail

		if($this->getView()->getRequest()->isPost()) {
			$mail = new \Pimcore\Mail();
			$mail->addTo('thomas@vomtom.at');
			$mail->setBodyText($this->getView()->getRequest()->getParam("name")." ".$this->getView()->getRequest()->getParam("email")."
".$this->getView()->getRequest()->getParam("phone")."

".$this->getView()->getRequest()->getParam("message"));
			$mail->send();

			// Create a new object
			$newObject = new Contacts();
			$newObject->setKey(\Pimcore\File::getValidFilename(date("Ymd")."_".$this->getView()->getRequest()->getParam("name")));
			$newObject->setParentId(8);
			$newObject->setName($this->getView()->getRequest()->getParam("name"));
			$newObject->setPhone($this->getView()->getRequest()->getParam("phone"));
			$newObject->setEmail($this->getView()->getRequest()->getParam("email"));
			$newObject->setMessage($this->getView()->getRequest()->getParam("message"));
			$newObject->save();

			$this->view->send_success = true;
		}

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
<?php

namespace Website\Controller;

use Pimcore\Controller\Action\Frontend;

class Action extends Frontend
{
    public function init()
    {
        if (self::$isInitial) {
            // only do this once
            // eg. registering view helpers or other generic things
        }

        parent::init();

        if (\Zend_Registry::isRegistered("Zend_Locale")) {
            $locale = \Zend_Registry::get("Zend_Locale");
        } else {
            $locale = new \Zend_Locale("en");
            \Zend_Registry::set("Zend_Locale", $locale);
        }

        $this->view->language = (string) $locale;
        $this->language = (string) $locale;

        $this->view->headLink()->appendStylesheet('/static/vendor/bootstrap/css/bootstrap.min.css');
        $this->view->headLink()->appendStylesheet('/static/css/clean-blog.min.css');
        $this->view->headLink()->appendStylesheet('/static/vendor/font-awesome/css/font-awesome.min.css');
        $this->view->headLink()->appendStylesheet('//fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic');
        $this->view->headLink()->appendStylesheet('//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800');
        $this->view->headScript()->appendFile('/static/vendor/jquery/jquery.min.js');
        $this->view->headScript()->appendFile('/static/vendor/bootstrap/js/bootstrap.min.js');
        $this->view->headScript()->appendFile('/static/js/jqBootstrapValidation.js');
        //$this->view->headScript()->appendFile('/static/js/contact_me.js');
        $this->view->headScript()->appendFile('/static/js/clean-blog.min.js');
    }
}

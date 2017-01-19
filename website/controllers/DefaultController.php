<?php

use Website\Controller\Action;

class DefaultController extends Action
{
    public function defaultAction()
    {
        $this->enableLayout();

    }

    public function blogarticleAction() {
        $this->enableLayout();
        $this->view->blogarticle = \Pimcore\Model\Object\Blogpost::getById($this->getParam("id"));
    }

    public function footerAction() {

    }
    public function headerAction() {

    }
}

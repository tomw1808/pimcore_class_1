<?php 

return [
    1 => [
        "id" => 1,
        "name" => "blogpost",
        "pattern" => "/\\/article\\/([0-9]+)\\/(.*)/",
        "reverse" => "/article/%id/%title",
        "module" => NULL,
        "controller" => "default",
        "action" => "blogarticle",
        "variables" => "id,title",
        "defaults" => NULL,
        "siteId" => NULL,
        "priority" => 0,
        "creationDate" => 1484671097,
        "modificationDate" => 1484671278
    ]
];

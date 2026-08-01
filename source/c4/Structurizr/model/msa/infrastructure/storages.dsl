objectStorage = container "Object Storage" {
    technology "S3 Compatible Storage"
    description "Объектное хранилище для хранения медиафайлов, изображений объектов размещения, CMS-контента и импортируемых документов."
    tags "Object Storage"
}

complianceObjectStorage = container "Compliance Object Storage" {
    technology "S3 + Object Lock (WORM)"
    description "Неизменяемое хранилище юридических документов: WORM, версии, шифрование, presigned URLs."
    tags "Object Storage"
}

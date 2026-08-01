/************************************************
 * OBJECT STORAGE
 ************************************************/

fourStayMicroservices.contentService -> fourStayMicroservices.objectStorage "Хранит изображения, медиафайлы и CMS-контент" "S3 API"
fourStayMicroservices.importService -> fourStayMicroservices.objectStorage "Хранит импортируемые файлы" "S3 API"
fourStayMicroservices.documentService -> fourStayMicroservices.complianceObjectStorage "Хранит неизменяемые юридические документы и договоры (WORM)" "S3 API"
fourStayMicroservices.complianceObjectStorage -> fourStayMicroservices.documentService "Выдает файлы документов по presigned URLs" "S3 API"

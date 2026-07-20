/************************************************
 * OBJECT STORAGE
 ************************************************/

fourStayMicroservices.contentService -> fourStayMicroservices.objectStorage "Хранит изображения, медиафайлы и CMS-контент" "S3 API"
fourStayMicroservices.importService -> fourStayMicroservices.objectStorage "Хранит импортируемые файлы" "S3 API"

/************************************************
 * PAYMENT FLOW
 ************************************************/

fourStayMicroservices.paymentService -> fourStayMicroservices.paymentGateway "Инициирует обработку платежей" "JSON / HTTPS"
fourStayMicroservices.paymentGateway -> stripe "Обрабатывает платежные операции" "JSON / HTTPS"

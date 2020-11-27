
test11 = "[{'maxPayments': 2, 'paymentTypeDescription': 'Multiplos Cartões de Crédito', 'paymentTypeName': 'Cartão de Crédito', 'paymentMethodName': 'Cartão de Crédito Amex 15x', 'additionDeliveryDays': None, 'value': 7979.12, 'balance': None, 'flags': ['Amex', 'Visa', 'Diners', 'Elo', 'Mastercard'], 'allowCombinations': True, 'paymentMethodId': '5010', 'isSpecialCondition': False, 'isInvoiceBusinessDay': False, 'invoiceDueDeadline': None}, {'maxPayments': 1, 'paymentTypeDescription': 'Adicionar Cartão de Crédito', 'paymentTypeName': 'Cartão de Crédito', 'paymentMethodName': 'Cartão de Crédito Amex 15x', 'additionDeliveryDays': None, 'value': 7979.12, 'balance': None, 'flags': ['Amex', 'Visa', 'Diners', 'Elo', 'Mastercard'], 'allowCombinations': False, 'paymentMethodId': '5010', 'isSpecialCondition': False, 'isInvoiceBusinessDay': False, 'invoiceDueDeadline': None}, {'maxPayments': 1, 'paymentTypeDescription': 'Boleto', 'paymentTypeName': 'Boleto', 'paymentMethodName': 'Boleto Bradesco', 'additionDeliveryDays': 2, 'value': 7979.12, 'balance': None, 'flags': [], 'allowCombinations': False, 'paymentMethodId': '5007', 'isSpecialCondition': False, 'isInvoiceBusinessDay': True, 'invoiceDueDeadline': 2}]"
test = (value)
teste2 = len(test)
#print(test)
#print(teste2)
obj0 = test.find("Cartão de Crédito")  
#print(obj0)
test0 = test[obj0:]
#cortado
#print(test0)
obj1 = test0.find("'value'")
test1 = test0[obj1+8:]
obj2 = test1.find(",")
test2 = test1[:obj2]
print(test2)
from datetime import datetime, timedelta

def cortar_addressId(addressId):
        test = (addressId)
        teste2 = len(test)
        print(test)
        print(teste2)
        obj0 = test.find("API-TESTE-FASTSHOP")  
        print(obj0)
        test0 = test[obj0:]
        print(test0)
        obj = test0.find("'addressId'")
        print(obj)
        Obj2 =  obj + 13
        Obj3 =  obj + 21
        test3 = test0[Obj2:Obj3]
        print(test3)
        return  test3

#acrescentar 60 minutos à data atual
def datadehoje():
        data =  (datetime.today() + timedelta(days=7))
        print(data)
        return  data

datadehoje()

def cortar_valor_cartao_de_credito(paymentMethods):
        test = (paymentMethods)
        teste2 = len(test)
        #print(test)
        print(teste2)
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
        return  test2

def cortar_valor_multiplos_cartao_de_credito(paymentMethods):
        test = (paymentMethods)
        teste2 = len(test)
        #print(test)
        print(teste2)
        obj0 = test.find("Multiplos Cartões de Crédito")  
        #print(obj0)
        test0 = test[obj0:]
        #cortado
        #print(test0)
        obj1 = test0.find("'value'")
        test1 = test0[obj1+8:]
        obj2 = test1.find(",")
        test2 = test1[:obj2]
        print(test2)
        return  test2

def cortar_valor_boleto(paymentMethods):
        test = (paymentMethods)
        teste2 = len(test)
        #print(test)
        print(teste2)
        obj0 = test.find("Boleto")  
        #print(obj0)
        test0 = test[obj0:]
        #cortado
        #print(test0)
        obj1 = test0.find("'value'")
        test1 = test0[obj1+8:]
        obj2 = test1.find(",")
        test2 = test1[:obj2]
        print(test2)
        return  test2

def cortar_valor_lista_casamento(paymentMethods):
        test = (paymentMethods)
        teste2 = len(test)
        #print(test)
        print(teste2)
        obj0 = test.find("Crédito de Lista de Casamento")  
        #print(obj0)
        test0 = test[obj0:]
        #cortado
        #print(test0)
        obj1 = test0.find("'value'")
        test1 = test0[obj1+8:]
        obj2 = test1.find(",")
        test2 = test1[:obj2]
        print(test2)
        return  test2
        
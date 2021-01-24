from helpers.menu import Menu
from controllers.producto import ProductoController

def app():
    try:
        print('''
        ==========================
            Tienda Virtual
        ==========================
        ''')
        menu_principal = ["Productos","Registrar Factura", "Salir"]
        respuesta = Menu(menu_principal).show()
        print(respuesta)
        if respuesta == 1:
            producto = ProductoController()
            producto.menu()
            if producto.salir:
                app()
        elif respuesta == 2:
            pass
  
        print("\n Gracias por utilizar el sistema \n")
    except KeyboardInterrupt:
        print('\n Se interrumpio la aplicación')
    except Exception as e:
        print(f'{str(e)}')

app()
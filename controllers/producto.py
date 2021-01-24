from models.producto import Producto
from helpers.menu import Menu
from helpers.helper import input_data, print_table, question


class ProductoController:
    def __init__(self):
        self.producto = Producto()
        self.salir = False

    def menu(self):
        try:
            while True:
                print('''
                ==================
                    Productos
                ==================
                ''')
                lista_menu = ["Listar", "Buscar", "Crear", "Salir"]
                respuesta = Menu(lista_menu).show()

                if respuesta == 1:
                    self.all_productos()
                elif respuesta == 2:
                    self.search_producto()
                elif respuesta == 3:
                    self.insert_producto()
                else:
                    self.salir = True
                    break
        except Exception as e:
            print(f'{str(e)}')

    def all_productos(self):
        try:
            print('''
            ==========================
                Listar Productos
            ==========================
            ''')
            productos = self.producto.get_productos('id_producto')
            print(print_table(productos, ['ID', 'Nombre', 'Precio', 'Stock']))
            input('\nPresiona una tecla para continuar...')
        except Exception as e:
            print(f'{str(e)}')

    def search_producto(self):
        print('''
        ========================
            Buscar Producto
        ========================
        ''')
        try:
            id_producto = input_data("Ingrese el ID del producto >> ", "int")
            producto = self.producto.get_producto({
                'id_producto': id_producto
            })
            print(print_table(producto, ['ID', 'Nombre', 'Precio', 'Stock']))

            if producto:
                if question('¿Deseas dar mantenimiento al producto?'):
                    opciones = ['Editar', 'Eliminar', 'Salir']
                    respuesta = Menu(opciones).show()
                    if respuesta == 1:
                        self.update_producto(id_producto)
                    elif respuesta == 2:
                        self.delete_producto(id_producto)
        except Exception as e:
            print(f'{str(e)}')
        input('\nPresiona una tecla para continuar...')

    def insert_producto(self):
        nombre = input_data('Ingrese el nombre del producto >> ')
        precio = input_data('Ingrese el precio del producto >> ', 'int')
        stock = input_data('Ingrese el Stock del producto >> ', 'int')
        self.producto.insert_producto({
            'nombre': nombre,
            'precio': precio,
            'stock': stock
        })
        print('''
        ================================
            Nuevo producto agregado
        ================================
        ''')
        self.all_productos()

    def update_producto(self, id_producto):
        nombre = input_data('Ingrese el nuevo nombre del producto >> ')
        precio = input_data('Ingrese el precio del producto >> ', 'int')
        stock = input_data('Ingrese el Stock del producto >> ', 'int')
        self.producto.update_producto({
            'id_producto': id_producto
        }, {
            'nombre': nombre,
            'precio': precio,
            'stock': stock
        })
        print('''
        ============================
            Producto Actualizado
        ============================
        ''')

    def delete_producto(self, id_producto):
        self.producto.delete_producto({
            'id_producto': id_producto
        })
        print('''
        =========================
            Producto Eliminado
        =========================
        ''')


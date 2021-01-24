from connection.conn import Connection


class Producto:
    def __init__(self):
        self.model = Connection('producto')

    def get_productos(self, order):
        return self.model.get_all(order)

    def get_producto(self, id_object):
        return self.model.get_by_id(id_object)

    def search_producto(self, data):
        return self.model.get_columns(data)

    def insert_producto(self, producto):
        return self.model.insert(producto)

    def update_producto(self, id_object, data):
        return self.model.update(id_object, data)

    def delete_producto(self, id_object):
        return self.model.delete(id_object)

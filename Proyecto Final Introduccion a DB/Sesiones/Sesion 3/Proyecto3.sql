Use classicmodels;


#1.- Obten el código de producto, nombre de producto y descripción(from product Lines) de todos los productos.
show keys from products;
show keys from productlines;

select p.productCode as Código, p.productName as Nombre_de_Producto, pl.productLine as Descripción
from products p 
right join productlines pl
on p.productLine = pl.productLine;

#2.-Obten el número de orden, estado y costo total de cada orden.
 show keys from orderdetails; # orderNumber (Key)
 show keys from orders;# orederNumber (Key)
 
 select od.orderNumber, o.status as Estado, sum(od.priceEach) as Total
 from orderdetails od
 right join orders o
 on od.orderNumber = o.orderNumber
 group by orderNumber;
 
 
 # 3.- Obten el número de orden, fecha de orden, línea de orden, nombre del producto, 
 # cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden
 
 show keys from products; # productLine, productCode
 show keys from orders;# orderNumber, customerNumber
 show keys from orderdetails;# orderNumber, productCode
 
 select od.orderNumber, o.orderDate, od.orderLineNumber, p.productName, od.orderLineNumber, od.priceEach, p.productLine
 from orderdetails od
 right join orders o
 on od.orderNumber = o.orderNumber
 right join products p
 on p.productCode = od.productCode
 order by p.productName;
 
 # 4.- Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
 
 show keys from orders; # orderNumber, customerNumber
 show keys from products; # productLine, productCode
 show keys from orderdetails;# orderNumber, productCode
 
 select o.orderNumber, p.productName as Nombre, p.MSRP as Precio_Sugerido, od.priceEach as Precio
 from orders o
 right join orderdetails od
 on o.orderNumber = od.orderNumber
 right join products p 
 on od.productCode = p.productCode
 order by p.productName;
 

Para estas consultas usa LEFT JOIN

 # 5.- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.
 
 select customers.customerNumber NumCliente, 
       customers.customerName Nombre, 
       orders.orderNumber NumOrden,
       customers.state Estado
from customers
left join orders on orders.customerNumber = customers.customerNumber; 

Para estas consultas usa RIGHT JOIN

 # 5.- Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.

select customers.customerNumber NumCliente, 
       customers.customerName Nombre, 
       orders.orderNumber NumOrden,
       customers.state Estado
from customers
right join orders on orders.customerNumber = customers.customerNumber;

# 6.- Obtén los clientes que no tienen una orden asociada.
# 7.- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, 
# es decir, los clientes asociados a cada empleado.

 
 
 
 
 
 
 
 
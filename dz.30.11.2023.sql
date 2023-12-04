
--В рамках БД песочница напишите след/запросы:


--Вывести мин/стоимость товаров для каждой категории
--(проекция: названиекатегории, минстоимость_товара)

SELECT 
    COUNT(*) AS MinProductPrice
FROM 
    Categories
JOIN 
    Products ON Categories.CategoryID = Products.CategoryID
GROUP BY 
    Categories.CategoryName

    

--Вывести ТОП-3 стран по количеству доставленных заказов (проекция:страны, ко-во заказов)

SELECT
    Customers.Country AS ShippingCountry,
    COUNT(Orders.OrderID) AS OrderCount
FROM
    Orders
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
    OrdersDetails.Quantity = 'Delivered'
GROUP BY
    Customers.Country
ORDER BY
    OrderCount DESC
LIMIT 3


--Вывести ко-во заказов у каждого менеджера (фамилияменеджера, ко-во заказов)

SELECT
    Employees.LastName AS ManagerLastName,
    COUNT(Orders.OrderID) AS OrderCount
FROM
    Employees
JOIN
    Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY
    Employees.LastName



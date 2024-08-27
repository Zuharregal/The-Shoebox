<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Summary</title>
    <link rel="stylesheet" href="css/tablestyle2.css">
</head>
<body>

    <style>
    h1 {
background-color: white;
}
</style>


    <div class="division">
    <h1>The Shoebox</h1>

        <?php
        include_once 'include/dbconnifs242.php';

        // Check if purchase parameter is set in the GET request

        if (isset($_GET['purchase'])) {

            // Retrieve customer information based on the provided email

            $email = $_GET['email'];
            $sql = "SELECT * FROM customers WHERE email = '$email'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $customerName = $row['first_name'];
                $customerLName = $row['last_name'];
                $deliveryAddress = $row['delivery_address'];

                echo '<h2>Order for ' . $customerName . ' ' . $customerLName . '</h2>';
                echo '<table>';
                echo '<tr>
                        <th colspan="3">Your Order</th>
                    </tr>';
                echo '<tr>
                        <th>Shoe</th>
                        <th>Price</th>
                    </tr>';

                $shoes = $_GET['shoes'];
                $totalPrice = 0;
                $subtotal = 0;

                // Create a new order in the "orders" table

                $customerId = $row['customer_id'];
                $orderSql = "INSERT INTO orders (customer_id, order_status) VALUES ('$customerId', 'Unfilled')";
                $conn->query($orderSql);

                // store the ID of the newly created order in the "orders" table. Associate each selected shoe with the corresponding order in the "order_items" table using the same order ID.

                $orderId = $conn->insert_id;

                // Loop through selected shoes and display them in the order summary table

                foreach ($shoes as $shoeId) {
                    $shoesql = "SELECT * FROM shoes WHERE shoe_id = '$shoeId'";
                    $shoeresult = $conn->query($shoesql);

                    if ($shoeresult->num_rows > 0) {
                        $shoeRow = $shoeresult->fetch_assoc();
                        $shoeName = $shoeRow['name'];
                        $shoePrice = $shoeRow['price'];
                        $total += $shoePrice;
                        $subtotal += $shoePrice;

                        echo '<tr>
                                <td>' . $shoeName . '</td>
                                <td>' . $shoePrice . '</td>
                            </tr>';

                        // Associate the shoe with the current order ID in the "order_items" table

                        $orderItemsSql = "INSERT INTO order_items (order_id, shoe_id) VALUES ('$orderId', '$shoeId')";
                        $conn->query($orderItemsSql);
                    }
                }

                // Display subtotal and total price with added VAT

                echo '<tr>
                        <td>Subtotal:</td>
                        <td colspan="2">' . $subtotal . '</td>
                    </tr>';

                $vat = $total * 1.15;

                echo '<tr>
                        <td style="font-weight:bold;">Total with VAT:</td>
                        <td colspan="2"><strong style="color: red;">' . $vat . '</strong></td>
                    </tr>';

                echo '</table>';
                echo '<p>Thank you for shopping with us!</p>';
                echo '<p>Your order will be delivered to the following address:</p>';
                echo '<p>' . $deliveryAddress . '</p>';
            } else {
                echo '<p>Order Rejected. Please register before you can make a purchase.</p>';
            }
        }

        // Close the database connection
        
        mysqli_close($conn);

        // Free result memory

        $result->free_result();
        ?>
    </div>

    <div class="column">
        <ul><li><a href="Index.html">Home Page</a></li>
        </ul>
    </div>
</body>
</html>

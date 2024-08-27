<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/style3.css">
</head>
<body>

        <h1>The Shoebox</h1>

         <div class="division">

        <?php
        // File that connects to the shoebox Database and queries it
        include_once 'include/dbconnifs242.php';

        // Input data retrieved from the form
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $email = $_POST['email'];
        $delivery_address = $_POST['delivery_address'];
        $cell_phone_number = $_POST['cell_phone_number'];
        $sa_id_number = $_POST['sa_id_number'];

        // Insert input data into table "the_shoebox.customers"
        $sql = "INSERT INTO customers (first_name, last_name, email, delivery_address, cell_phone_number, sa_id_number) VALUES ('$first_name', '$last_name', '$email', '$delivery_address', '$cell_phone_number', '$sa_id_number')";

        // Check if processing is successful or not
        if (mysqli_query($conn, $sql)) {
            echo "<p>You are successfully registered, please place an order!</p>"
            ;
        } else {
            echo "<p>Error, please try again</p>";
        }
        // comment - If column with links do not show, go straight to the orders page and place order.

        // Close connection
        mysqli_close($conn);

        // Free result memory
        $result->free_result();
        ?>
    </div>
    
    <div class="column">
        <ul>
            <li><a href="Order.php">Place an Order</a></li>
        </ul>
    </div>
</body>
</html>
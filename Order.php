<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/tablestyle.css">
    <title>Place Order</title>
</head>
<body>
<style>

h1 {
background-color: #DECFAC;
}
</style>


  <div class="division">

    <h1>The Shoebox</h1>
    
    <h2>Order</h2>

        <form method="get" action="ViewOrder.php">
            <table>
                <tr>
                    <th colspan="8">SHOES</th>
                </tr>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Brand</th>
                    <th>Colour</th>
                    <th>Material</th>
                    <th>Description</th>
                    <th>Select</th>
                </tr>

                <?php
                // Connect to the database 
                include_once 'include/dbconnifs242.php';

                // Query the database to fetch shoe information
                $sql = "SELECT * FROM shoes";
                $result = mysqli_query($conn, $sql);

                // Display each shoe as a table row
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>";
                    echo "<td><img src='images/{$row['image']}' alt='{$row['name']}' width='150'></td>";
                    echo "<td>{$row['name']}</td>";
                    echo "<td>{$row['price']}</td>";
                    echo "<td>{$row['brand']}</td>";
                    echo "<td>{$row['colour']}</td>";
                    echo "<td>{$row['material']}</td>";
                    echo "<td>{$row['description']}</td>";
                    echo "<td><input type='checkbox' name='shoes[]' value='{$row['shoe_id']}'></td>";
                    echo "</tr>";
                }

                // Close the database connection
                mysqli_close($conn);

                // Free result memory
                $result->free_result();
                ?>
            </table>
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="submit" name="purchase" value="Place Order"><br><br>
        </form>
    </div>
    <div class="column">
        <ul>
            <li><a href="Index.html">Home Page</a></li>
            <li><a href="Registration.html">Register</a></li>
        </ul>
    </div>
</body>
</html>

<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_USER_NOTICE);

if (!isset($_SESSION)) {
    session_start();
}

include 'connection.php';

function alert_box($msg)
{
    echo "<script>alert(\"".$msg."\")</script>";
}

function redirect($url)
{
    echo '<script type="text/javascript">window.location = "'.$url.'"</script>';
}

function getVendorCount($con)
{
    $sql = "SELECT COUNT(*) AS count FROM vendor";
    $result = $con->query($sql);
    $count = 0;
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $count = $row['count'];
    }
    return $count;
}

function getCustomerCount($con)
{
    $sql = "SELECT COUNT(*) AS count FROM customer";
    $result = $con->query($sql);
    $count = 0;
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $count = $row['count'];
    }
    return $count;
}

function getProductCount($con)
{
    $sql = "SELECT COUNT(*) AS count FROM products";
    $result = $con->query($sql);
    $count = 0;
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $count = $row['count'];
    }
    return $count;
}

function Register(string $username1, string $pasword, string $email)
{
    include 'connection.php';
    $pasword = password_hash($pasword, PASSWORD_DEFAULT);

    try {
        $sql = "INSERT INTO admin VALUES (NULL,?,?,?,'admin')";
        $stmt = $con->prepare($sql);
        $stmt->bind_param("sss", $username1, $email, $pasword);
        $stmt->execute();
        $_SESSION['success'] = "Registered Success";
    } catch (mysqli_sql_exception $err) {
        alert_box(mysqli_error($con));
    } finally {
        $stmt->close;
        $con->close;
    }
}

function Login(string $username1, string $password1)
{
    include 'connection.php';
    $pasword = password_hash($password1, PASSWORD_DEFAULT);
    error_log($password1);
    try {
        $sql = "SELECT * from admin where username= ?";
        $stmt = $con->prepare($sql);
        $stmt->bind_param("s", $username1);
        $stmt->execute();
        $result = $stmt->get_result();
        if (!$result) {
            error_log(mysqli_error($con));
        }
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (password_verify($password1, $row['password'])) {
                    return "logedin";
                    $_SESSION['success'] = "Edited Success";
                }
            }
        } else {
            return "wrongpass";
        }
        if (mysqli_error($con)) {
            error_log(mysqli_error($con));
        }
    } catch (mysqli_sql_exception $err) {
        alert_box(mysqli_error($con));
    }
}

if (isset($_GET['delete_vendor']) && isset($_GET['id'])) {
    $vendor_id = $_GET['id'];
    $sql = "DELETE FROM vendor WHERE id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $vendor_id);
    if ($stmt->execute()) {
        $_SESSION['success'] = "Vendor deleted successfully";
    } else {
        $_SESSION['error'] = "Error deleting vendor: " . $stmt->error;
    }
    $stmt->close();
    redirect('vendors.php');
}
if (isset($_GET['delete_customer'])) {
    $customer_id = $_GET['id'];
    $sql = "DELETE FROM customer WHERE customer_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $customer_id);
    if ($stmt->execute()) {
        $_SESSION['success'] = "Customer deleted successfully";
    } else {
        $_SESSION['error'] = "Error deleting customer: " . $stmt->error;
    }
    $stmt->close();
    redirect('customer.php');
}

if (isset($_GET['payment_status'])) {
    $con->query('UPDATE orders SET payment_status="' . $_GET['payment_status'] . '" WHERE order_id = ' . $_GET['order_id']);
    $con->close;
    $_SESSION['success'] = "Payment Status Updated ";
    redirect('orders.php');
}

if (isset($_GET['delete_order'])) {
    $order_id = $_GET['id'];
    $sql = "DELETE FROM orders_product WHERE order_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $order_id);
    $stmt->execute();

    $sql = "DELETE FROM orders WHERE order_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if ($stmt->execute()) {
        $_SESSION['success'] = "Order deleted successfully";
    } else {
        $_SESSION['error'] = "Error deleting order: " . $stmt->error;
    }
    $stmt->close();
    redirect('orders.php');
}

if (isset($_GET['delete_product'])) {
    $product_id = $_GET['id'];
    $sql = "DELETE FROM products WHERE product_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $product_id);
    if ($stmt->execute()) {
        $_SESSION['success'] = "Product deleted successfully";
    } else {
        $_SESSION['error'] = "Error deleting product: " . $stmt->error;
    }
    $stmt->close();
    redirect('product.php');
}
?>

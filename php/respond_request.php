<?php
session_start();
include_once "config.php";

// Ensure user is logged in
if(!isset($_SESSION['unique_id'])){
    echo "Unauthorized";
    exit;
}

$receiver_id = (int) $_SESSION['unique_id'];

// Validate POST
if(!isset($_POST['sender_id']) || !isset($_POST['action'])){
    echo "Invalid request";
    exit;
}

$sender_id = (int) $_POST['sender_id'];
$action = $_POST['action']; // expected 'accept' or 'reject'

if($action === 'accept'){
    $status = 'accepted';
} elseif($action === 'reject'){
    $status = 'rejected';
} else {
    echo "Invalid action";
    exit;
}

// Update only when the receiver matches the logged-in user
$sql = "UPDATE message_requests SET status = '{$status}' WHERE sender_id = {$sender_id} AND receiver_id = {$receiver_id}";
$res = mysqli_query($conn, $sql);

if($res){
    if(mysqli_affected_rows($conn) > 0){
        echo "Request {$status} successfully!";
    } else {
        echo "No matching request found or already processed.";
    }
} else {
    echo "Failed to update request: " . mysqli_error($conn);
}

?>

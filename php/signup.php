<?php
session_start();
include_once "config.php";

if(isset($_POST)){
    $fname = mysqli_real_escape_string($conn, $_POST['fname'] ?? '');
    $lname = mysqli_real_escape_string($conn, $_POST['lname'] ?? '');
    $email = mysqli_real_escape_string($conn, $_POST['email'] ?? '');
    $password = mysqli_real_escape_string($conn, $_POST['password'] ?? '');

    if(!empty($fname) && !empty($lname) && !empty($email) && !empty($password)){
        // check if email already exists
        $sql = mysqli_query($conn, "SELECT * FROM users WHERE email = '{$email}'");
        if(mysqli_num_rows($sql) > 0){
            echo "$email - This email already exists!";
            exit;
        }

        if(isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK){
            $img_name = $_FILES['image']['name'];
            $img_tmp = $_FILES['image']['tmp_name'];
            $img_size = $_FILES['image']['size'];

            $img_ext = strtolower(pathinfo($img_name, PATHINFO_EXTENSION));
            $allowed_ext = array('png','jpg','jpeg','gif');
            if(!in_array($img_ext, $allowed_ext)){
                echo "Please upload an image file - png, jpg, jpeg or gif";
                exit;
            }

            // generate unique image name and move
            $new_img_name = time() . rand(1000,9999) . '.' . $img_ext;
            $img_upload_path = __DIR__ . '/images/' . $new_img_name;
            if(!is_dir(__DIR__ . '/images')){
                mkdir(__DIR__ . '/images', 0755, true);
            }
            if(!move_uploaded_file($img_tmp, $img_upload_path)){
                echo "Failed to upload image.";
                exit;
            }
        }else{
            echo "Please select an image file.";
            exit;
        }

        // insert user
        $enc_pass = md5($password);
        $status = "Active now";
        // create a unique_id (use time + random)
        $unique_id = time() + rand(100,999);

        $insert_sql = "INSERT INTO users (unique_id, fname, lname, email, password, img, status) VALUES ('{$unique_id}','{$fname}','{$lname}','{$email}','{$enc_pass}','{$new_img_name}','{$status}')";
        $res = mysqli_query($conn, $insert_sql);
        if($res){
            $_SESSION['unique_id'] = $unique_id;
            echo "success";
            exit;
        }else{
            // cleanup uploaded image on failure
            if(isset($new_img_name) && file_exists(__DIR__ . '/images/' . $new_img_name)){
                unlink(__DIR__ . '/images/' . $new_img_name);
            }
            echo "Something went wrong. Please try again!";
            exit;
        }

    }else{
        echo "All input fields are required!";
        exit;
    }
}

?>

<?php 
    
    session_start();
    if(isset($_SESSION['unique_id'])){
        include_once "config.php";
        $outgoing_id = $_SESSION['unique_id'];
        $incoming_id = mysqli_real_escape_string($conn, $_POST['incoming_id']);
        $output = "";
       


       
        // Execute the first query
        $sql = "SELECT * FROM messages LEFT JOIN users ON users.unique_id = messages.outgoing_msg_id
                WHERE (outgoing_msg_id = {$outgoing_id} AND incoming_msg_id = {$incoming_id})
                OR (outgoing_msg_id = {$incoming_id} AND incoming_msg_id = {$outgoing_id}) ORDER BY msg_id";
        $query = mysqli_query($conn, $sql);

        $check_There_Is_massage_or_not = FALSE;
        // Check if there are results from either query
        if(mysqli_num_rows($query) > 0 ){
            $check_There_Is_massage_or_not = TRUE;
            while($row = mysqli_fetch_assoc($query)) {             



                if($row['outgoing_msg_id'] === $outgoing_id) {
                    if(!empty(htmlspecialchars($row['msg']))){
                        $output .= '<div class="chat outgoing">
                                        <div class="details">
                                            <p>'. $row['msg'] .'</p>
                                             
                                         </div>
                                    </div>';
                    }
                    if(!empty(htmlspecialchars($row['SendImg']))){
                        $output .= '<div class="chat outgoing">
                                    <div class="details">
                                        <p class = "chatimage"><img src="php/Sendimages/'. htmlspecialchars($row['SendImg']) .'" alt=""></p>
                                    </div>
                                    </div>';

                    }
                    if(!empty(htmlspecialchars($row['SendVideo']))){
                        $output .= '<div class="chat outgoing">
                                    <div class="details"> 
                                    <p class = "chatimage"><img src="php\images\downloadDefalt.jpg" alt="">'.$row['SendVideo'].'</p>
                                    </div>
                                    </div>';

                    }
                    if(!empty(htmlspecialchars($row['Senddocument']))){
                        $output .= '<div class="chat outgoing">
                                    <div class="details"> 
                                    <p class = "chatimage"><i class="fa-regular fa-file-alt"></i>'.$row['Senddocument'].'</p>
                                    </div>
                                    </div>';

                    }

                } else {
                    // $output .= '<div class="chat incoming">
                    //             <img src="php/images/'. htmlspecialchars($row['img']) .'" alt="">
                    //             <div class="details">
                    //                 <p>'. htmlspecialchars($row['msg']) .'</p>
                    //             </div>
                    //             </div>';
                                
                    if(!empty(htmlspecialchars($row['msg']))){
                        $output .= '<div class="chat  incoming">
                                    <img src="php/images/'. htmlspecialchars($row['img']) .'" alt="">
                                        <div class="details">
                                            <p>'. $row['msg'] .'</p>
                                         </div>
                                    </div>';
                    }
                    if(!empty(htmlspecialchars($row['SendImg']))){
                        $output .= '<div class="chat  incoming">
                                    <img src="php/images/'. htmlspecialchars($row['img']) .'" alt="">
                                    <div class="details">
                                        <p class = "chatimage"><img src="php/Sendimages/'. htmlspecialchars($row['SendImg']) .'" alt=""> <a href="php/Sendimages/'. htmlspecialchars($row['SendImg']) .'" download="image.jpg" class="download-btn"><i class="fa-solid fa-download"></i></a></p>
                                        
                                    </div>
                                    </div>';

                    }
                    if(!empty(htmlspecialchars($row['SendVideo']))){
                        $output .= '<div class="chat  incoming">
                                    <img src="php/images/'. htmlspecialchars($row['img']) .'" alt="">
                                    <div class="details">
                                        <p class = "chatimage"><img src="php\images\downloadDefalt.jpg" alt="">'.$row['SendVideo'].'
                                        <a href="php/Sendimages/'. htmlspecialchars($row['SendVideo']) .'" download="video.mp4" class="download-btn"><i class="fa-solid fa-download"></i></a></p>
                                    </div>
                                    </div>';

                    }
                    if (!empty(htmlspecialchars($row['Senddocument']))) {
                        $output .= '<div class="chat incoming">
                                        <img src="php/images/' . htmlspecialchars($row['img']) . '" alt="">
                                        <div class="details">
                                            <p class="chatdocument">
                                              
                                                <i class="fa-regular fa-file-alt"></i> ' . htmlspecialchars($row['Senddocument']) . '
                    
                                                <!-- Download button for the document -->
                                                <a href="php/Sendimages/' . htmlspecialchars($row['Senddocument']) . '" download="' . htmlspecialchars($row['Senddocument']) . '" class="download-btn">
                                                    <i class="fa-solid fa-download"></i> 
                                                </a>
                                            </p>
                                        </div>
                                    </div>';
                    }
                    
                }
            }
        }
 
        if($check_There_Is_massage_or_not == FALSE){
            $output .= '<div class="text">No messages are available. Once you send a message they will appear here.</div>';
        }
        
        echo $output;
    } else {
        header("location: ../login.php");
    }
  
    
?>
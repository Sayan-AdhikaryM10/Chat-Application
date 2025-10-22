<?php

// Check if users are available (this file expects $query, $conn and $outgoing_id to be defined earlier)

    while ($row = mysqli_fetch_assoc($query)) {

        $user_unique = (int) $row['unique_id'];

        $sql2 = "SELECT * FROM messages WHERE (incoming_msg_id = {$user_unique} OR outgoing_msg_id = {$user_unique}) 
                 AND (outgoing_msg_id = {$outgoing_id} OR incoming_msg_id = {$outgoing_id}) ORDER BY msg_id DESC LIMIT 1";
        $query2 = mysqli_query($conn, $sql2);

        // Prepare default values
        $resultRaw = '';
        $msg = 'No message available';
        $you = '';

        if ($query2 && mysqli_num_rows($query2) > 0) {
            $row2 = mysqli_fetch_assoc($query2);
            $resultRaw = $row2['msg'] ?? '';
            $msg = (strlen($resultRaw) > 12) ? substr($resultRaw, 0, 12) . '...' : $resultRaw;
            if (isset($row2['outgoing_msg_id'])) {
                $you = ($outgoing_id == $row2['outgoing_msg_id']) ? 'You: ' : '';
            }
        }

        $offline = ($row['status'] == 'Offline now') ? 'offline' : '';
        $hid_me = ($outgoing_id == $row['unique_id']) ? 'hide' : '';

        $user_id = $user_unique;

        // Check if there is a pending message request involving the logged-in user
        $checkRequestSql = "SELECT sender_id, receiver_id, status FROM message_requests 
                            WHERE (sender_id = {$outgoing_id} AND receiver_id = {$user_id}) 
                               OR (sender_id = {$user_id} AND receiver_id = {$outgoing_id})";
        $checkRequest = mysqli_query($conn, $checkRequestSql);
        $request = ($checkRequest) ? mysqli_fetch_assoc($checkRequest) : null;

        // Sanitize user fields for output
        $safe_fname = htmlspecialchars($row['fname']);
        $safe_lname = htmlspecialchars($row['lname']);
        $safe_img = htmlspecialchars($row['img']);
        $safe_msg = htmlspecialchars($msg);

        // Determine what button to display based on request status
        if ($request) {
            $status = $request['status'];
            if ($status == 'accepted') {
                $output .= '<a class="hover-underline-animation" href="chat.php?user_id='. $user_id .'">
                <div class="content">
                <img src="php/images/'. $safe_img .'" alt="">
                <div class="details">
                    <span>'. $safe_fname. ' ' . $safe_lname .'</span>
                    <p>'. $you . $safe_msg .'</p>
                </div>
                </div>
                <div class="status-dot '. $offline .'"><i class="fas fa-circle"></i></div>
            </a>';
            } elseif ($status == 'pending' && $request['receiver_id'] == $outgoing_id) {
                $chat_button = '<button class="SendButton-Request" onclick="respondRequest(' . (int)$request['sender_id'] . ', \"accept\")">Accept</button>
                                <button class="SendButton-Request" onclick="respondRequest(' . (int)$request['sender_id'] . ', \"reject\")">Reject</button>';
                 $output .= '<a class="hover-underline-animation">
                    <div class="content">
                    <img src="php/images/'. $safe_img .'" alt="">
                    <div class="details">
                        <span>'. $safe_fname. ' ' . $safe_lname .'</span>
                        <p>'. $you . $safe_msg .'</p>
                    </div>
                    </div>
                    ' . $chat_button . '
                    <div class="status-dot '. $offline .'"><i class="fas fa-circle"></i></div>
                </a>';
            } elseif ($status == 'rejected' && $request['sender_id'] == $outgoing_id)  {
                $chat_button = '<button class="SendButton-Request" onclick="sendMessageRequest(' . $user_id . ')">Send Request</button>';
                 $output .= '<a class="hover-underline-animation">
                    <div class="content">
                    <img src="php/images/'. $safe_img .'" alt="">
                    <div class="details">
                        <span>'. $safe_fname. ' ' . $safe_lname .'</span>
                        <p>'. $you . $safe_msg .'</p>
                    </div>
                    </div>
                    ' . $chat_button . '
                    <div class="status-dot '. $offline .'"><i class="fas fa-circle"></i></div>
                </a>';
             } else {
                $chat_button = '<span>'.htmlspecialchars($status).'</span>';
                 $output .= '<a class="hover-underline-animation">
                    <div class="content">
                    <img src="php/images/'. $safe_img .'" alt="">
                    <div class="details">
                        <span>'. $safe_fname. ' ' . $safe_lname .'</span>
                        <p>'. $you . $safe_msg .'</p>
                    </div>
                    </div>
                    ' . $chat_button . '
                    <div class="status-dot '. $offline .'"><i class="fas fa-circle"></i></div>
                </a>';
            }
        } else {
            $chat_button = '<button class="SendButton-Request" onclick="sendMessageRequest(' . $user_id . ')">Send Request</button>';
             $output .= '<a class="hover-underline-animation">
                    <div class="content">
                    <img src="php/images/'. $safe_img .'" alt="">
                    <div class="details">
                        <span>'. $safe_fname. ' ' . $safe_lname .'</span>
                        <p>'. $you . $safe_msg .'</p>
                    </div>
                    </div>
                    ' . $chat_button . '
                    <div class="status-dot '. $offline .'"><i class="fas fa-circle"></i></div>
                </a>';
        }
             
    }

?>
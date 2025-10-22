const form = document.querySelector(".signup form"),
  continueBtn = form.querySelector(".button input"),
  errorText = form.querySelector(".error-text");

form.addEventListener('submit', function(e){
  e.preventDefault();
  if(!form) return;
  errorText.style.display = 'none';
  if(continueBtn) {
    continueBtn.disabled = true;
    // keep original label if provided, else fallback
    const originalLabel = continueBtn.getAttribute('data-original') || continueBtn.value;
    continueBtn.setAttribute('data-original', originalLabel);
    continueBtn.value = 'Please wait...';
  }

  const xhr = new XMLHttpRequest();
  xhr.open("POST", "php/signup.php", true);
  xhr.onload = function(){
    if(continueBtn){
      continueBtn.disabled = false;
      continueBtn.value = continueBtn.getAttribute('data-original') || 'Continue to Chat';
    }
    if(xhr.status === 200){
      const data = xhr.response.trim();
      if(data === "success"){
        location.href = "users.php";
      }else{
        errorText.style.display = "block";
        errorText.textContent = data;
      }
    }else{
      errorText.style.display = "block";
      errorText.textContent = 'Server error: ' + xhr.status;
    }
  };
  xhr.onerror = function(){
    if(continueBtn){
      continueBtn.disabled = false;
      continueBtn.value = continueBtn.getAttribute('data-original') || 'Continue to Chat';
    }
    errorText.style.display = "block";
    errorText.textContent = 'Network error. Please try again.';
  };

  const formData = new FormData(form);
  xhr.send(formData);
});
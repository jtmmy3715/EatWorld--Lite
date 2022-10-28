		function back(){
			history.back();
			 }
	
	(function($) {
	    'use strict';

	    $(document).ready(function() {
	        $(".bs-submit").click(function() {
	      
	          //Fetch form to apply custom Bootstrap validation
	          var form = $(".needs-validation")
	      
	          if (form[0].checkValidity() === false) {
	            event.preventDefault()
	            event.stopPropagation()
	          }

	          form.addClass('was-validated');
	      
	          //Make ajax call here
	      
	        })
	      });

	      
	    function isNumberKey(evt){
	        var charCode = (evt.which) ? evt.which : event.keyCode
	        if (charCode > 31 && (charCode < 48 || charCode > 57))
	            return false;
	        return true;
	    }




	    //to confirm input takes only number input
	    //use class ".shouldNumber" in your html <input type="text" /> element
	    $('.shouldNumber').on('keypress', function() {
	        return isNumberKey(event)
	    });

	  })(jQuery);
		jQuery("#ClientForm").validate({
          rules: {
        	  clientUsername: {
                  required: true,
              },
              clientPassword: {
                  required: true,
                  minlength: 8
              },
              clientPhone: {
                  required: true,
                  digits:true, 
                  maxlength: 10
              },
              clientEmail: {
                  required: true,
                  email: true
              },
              clientBirthday: {
                  required: true,
              },
              clientPoint: {
                  required: true,
                  number: true
              },
              clientVip: {
                  required: true,
                  number: true

              }
          },
          messages: {
        	  clientUsername: {
                  required: "帳號為必填",
              },
              clientPassword: {
                  required: "密碼為必填",
                  minlength:$.validator.format("密碼不得少於8個字")
              },
              clientPhone: {
            	  required: "電話為必填",
            	  maxlength:$.validator.format("電話格式不正確")
              },
              clientEmail: {
            	  required: "必填",
            	  email: "請輸入正確Email格式"
              },
              clientBirthday: {
            	  required: "必填",
              },
              clientPoint: {
            	  required: "必填",
            	  number: "只能輸入整數"
              },
              clientVip: {
            	  required: "必填",
            	  number: "只能輸入整數"
              }
          },
		
		 ignore: [],
		    errorClass: "invalid-feedback animated fadeInUp",
		    errorElement: "div",
		    errorPlacement: function(e, a) {
		        jQuery(a).parents(".form-group > div").append(e)
		    },
		    highlight: function(e) {
		        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
		    },
		    success: function(e) {
		        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-valid")
		    }


		});
		
    $(function(){
		
		$('#correct').click(function (){
			
			$('#clientUsername').val("gina0810");
			$('#clientPassword').val("gina0810");
			$('#clientPhone').val("0929111222");
			$('#clientEmail').val("gina0810@gmail.com");
			$('#clientBirthday').val("1993-02-15");
			$('#clientPoint').val("222");
			$('#clientVip').val("3");
			
		})
	
		$('#error').click(function (){
			
			$('#clientUsername').val("gina");
			$('#clientPassword').val("");
			$('#clientPhone').val("09291112222666");
			$('#clientEmail').val("gina0810gmail");
			$('#clientBirthday').val("1993-02-15");
			$('#clientPoint').val("-1");
			$('#clientVip').val("2");
			
		})
	
		
	})



$(document).ready(function(){
    $(".openMenu").click(function(){
        //alert('ss');
        $('section.sidebar').addClass('open');
    });

    $("span.close").click(function(){
        $('section.sidebar').removeClass('open');
    });
});

// Profile Page Js
$('document').ready(function() {

    // Edit Profile Js
    $('#editprofileBtn , #editprofileButton').click(function() {
        $(".profileActions .profileDeatils , .profileActions .addressBook").addClass('hide');
    });
    $('#editprofileBtn , #editprofileButton').click(function() {
        $(".profileActions .editProfileDv").addClass('show');
    });
    // Edit Profile Js

    // Edit Profile Back Js
    $('#goBackEditProfile').click(function() {
        $(".profileActions .profileDeatils , .profileActions .addressBook").addClass('show');
    });
    // $('#goBackEditProfile').click(function() {

    // });

    // Edit Profile Back Js

    // Email Verification Js
    $('#editemailBox').click(function() {
        $(".profileActions .profileDeatils , .profileActions .addressBook , .profileActions .title").addClass('hide');
    });
    $('#editemailBox').click(function() {
        $(".profileActions .EditemailVerification").addClass('show');
    });
    // Email Verification Js

    // Mobile Number Change Js
    $('#editNumber').click(function() {
        $(".profileActions .profileDeatils , .profileActions .addressBook , .profileActions .title").addClass('hide');
    });
    $('#editNumber').click(function() {
        $(".EditMobileNumber").addClass('show');
    });
    // Mobile Number Change Js

});
// Profile Page Js

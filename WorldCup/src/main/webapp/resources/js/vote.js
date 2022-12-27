$(function () {
    
    var home = 99;
    var away = 100;
    var total = 262;

    function vote_home() {
        home++;
    }

    function vote_away() {
        away++;
    }

    function homeclick() {
        vote_home();
        let hap=home+away;      
        let width_away=total*(away/hap);
        let width_home=total*(home/hap);
        $('.vote_away').width(width_away+'px');
        $('.vote_home').width(width_home+'px');
        $('.count_home').text(home);
    }
    function awayclick() {
        vote_away();
        let hap=home+away;      
        let width_away=total*(away/hap);
        let width_home=total*(home/hap);
        $('.vote_away').width(width_away+'px');
        $('.vote_home').width(width_home+'px');
        $('.count_away').text(away);
    }

    $('.vote_home_cover').click(homeclick);

    $('.vote_away_cover').click(awayclick);

    $(document).ready(function(){
        homeclick();
      });

});

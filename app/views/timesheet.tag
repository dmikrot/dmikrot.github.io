<timesheet>
  <div class="well visible-lg-block">
    <div id="{ timesheet_id }"></div>
  </div>

  this.lpad = function lpad(str, pad) {
    return (pad + str).slice(-pad.length);
  };

  this.get_random_id = function get_random_id() {
    return this.lpad(Math.floor(Math.random() * 10000000000), '00000000000');
  };

  this.timesheet_id = 'timesheet' + this.get_random_id();

  this.on('mount', function on_mount() {
    var now = new Date();
    var current = this.lpad(now.getMonth() + 1, '00') + '/' + now.getFullYear();

    var container = this['{ timesheet_id }'];

    var self = this;
    setTimeout(function () {
      self.timesheet = new Timesheet(container, 2001, now.getFullYear(), [
        ['07/2001', '05/2005', 'Totino-Grace High School', 'student'],
        ['09/2002', '04/2008', 'Theatrical Electrician', 'hobby'],
        ['2003', '2005', 'Quizno\'s Subs | Sandwich Artist', 'employee'],
        ['06/2003', '06/2003', 'Germany', 'travel'],
        ['03/2005', '04/2005', 'Greece', 'travel'],
        ['08/2005', '05/2009', 'Colorado State University', 'student'],
        ['10/2005', '02/2009', 'Shorin-Ryu Karate', 'hobby'],
        ['06/2006', '08/2006', 'Axciom Corporation | Technology Intern', 'intern'],
        ['03/2007', '11/2007', 'Colorado State University | Web Development Intern', 'intern'],
        ['05/2008', '08/2008', 'Hewlett-Packard | QA Intern', 'intern'],
        ['05/2009', '04/2011', 'Medioh! Inc. | Software Developer', 'employee'],
        ['05/2011', current, 'Perficient Inc. | Sr. Technical Consultant', 'employee'],
        ['01/2014', '01/2015', 'Marbles.mx Co-founder', 'hobby'],
        ['07/2014', '07/2014', 'RAGBRAI', 'hobby'],
        ['11/2014', '12/2014', 'India', 'travel']
      ]);
    }, 5);
  });

</timesheet>
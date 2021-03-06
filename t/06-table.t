use Test;
use Pod::To::HTML;

plan 3;

my $r;

=table
  col1  col2

$r = pod2html $=pod[0];
#say $r.perl;
ok $r ~~ ms[[
    '<table class="pod-table">' 
      '<tbody>'
        '<tr>' 
          '<td>' col1 '</td>'
          '<td>' col2 '</td>'
        '</tr>'
      '</tbody>' 
    '</table>'
]];

=table
  H1    H2
  --    --
  col1  col2

$r = pod2html $=pod[1];
#say $r.perl;
ok $r ~~ ms[[
    '<table class="pod-table">'
      '<thead>'
        '<tr>' 
          '<th>' H1 '</th>'
          '<th>' H2 '</th>'
        '</tr>'
      '</thead>' 
      '<tbody>'
        '<tr>' 
          '<td>' col1 '</td>'
          '<td>' col2 '</td>'
        '</tr>'
      '</tbody>' 
    '</table>'
]];


=begin table

  H1    H2
  --    --
  col1  col2

  col1  col2

=end table

$r = pod2html $=pod[2];
#say $r.perl;
ok $r ~~ ms[[
    '<table class="pod-table">'
      '<thead>'
        '<tr>' 
          '<th>' H1 '</th>'
          '<th>' H2 '</th>'
        '</tr>'
      '</thead>' 
      '<tbody>'
        '<tr>' 
          '<td>' col1 '</td>'
          '<td>' col2 '</td>'
        '</tr>'
        '<tr>' 
          '<td>' col1 '</td>'
          '<td>' col2 '</td>'
        '</tr>'
      '</tbody>' 
    '</table>'
]];


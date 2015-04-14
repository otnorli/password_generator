use strict;
use warnings;

# For testing the function
my $PASSWORD_GENERATED; # Generate this password
START: main(); # Start processing main function

# Call passgen and print result, for testing
sub main {
   $PASSWORD_GENERATED = passgen();
   print $PASSWORD_GENERATED;
}

###########################################################################
# sub passgen
# 
###########################################################################
#
# General description: This function generates a password
# 
# Detailed description:
# The function takes no input.
# This function generates an 8 letter password by drawing  
# a random consonant, followed by a random vowel, then a random consonant, 
# and so on. The letters are appended to the string $pw. 
# The function returns $pw.
# 
###########################################################################

sub passgen {
  # Declear pw
  my $pw        = "";

  # Define arrays of vowels and consonants
  # qw function works like this:
  # qw(a e o...) = ('a', 'e', 'o', ...)
  my @vowel     = qw(a e o u y); # Length of array is 5
  my @consonant = qw(b d f g h j k m n p r s t v); # Length is 14

  # Unused variabel
  my $total     = 1;

  # Dummie variables for use in while loop
  my $j; # Variable to tell length of array in use
  my $n = 1; # Counter for length of password
  my $v = 2; # This is set to random value, will oscillate between positive and negative

  while ( $n < 9 ) { # $n < 9 sets passlen to 9-1 = 8, n starts at 1

    $v = -$v; # Change sign on $v

    if ( $v < 0 ) {
      $j = 14; # If v is negative set length of array ($j) to 14
    }

    else {
      $j = 5; # If v is positive set length of array ($j) to 5
    }
    my $i = int( rand($j) ); # Get random integer value between 0 and (j-1)

    # If $v is negative we pick next letter in password from consonants array
    if ( $v < 0 ) {
      # Append this letter to pw, i holds value 0 <= i <= 13
      $pw = $pw . $consonant[$i];
    }

    # If $v is positive we pick next letter from vowels array
    else {
      # Append the letter to pw, i holds value 0 <= i <= 4
      $pw = $pw . $vowel[$i];
    }

    # Iterate n
    $n++;
  }

  # Return password
  return ($pw);
}

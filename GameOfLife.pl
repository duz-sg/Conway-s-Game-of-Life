#!/usr/bin/env perl 

use strict;
use warnings;
use feature qw(say);
use Data::Dumper;

sub computeNextLife
{
	my $lastLifeRef = shift;
	my $lastLifeArr = @{$lastLifeRef};
	my @nextLifeArr = ();

	my $row = 0;
	my $col = 0;
	my $row_max = @{$lastLifeRef};
	my $col_max = 0;
	for ( @{$lastLifeRef} )
	{
		my $rowRef = $_;
		$col = 0;
		for ( @{$rowRef} )
		{
			my $cell = $_;
			$col_max = @{$rowRef};
			$nextLifeArr[$row][$col] = computeCellNextLife($row, $col, $lastLifeRef, $row_max, $col_max );
			$col ++;
		}
		$row ++;
	}
	my $nextLifeRef = \@nextLifeArr;

	return $nextLifeRef;
}

sub computeCellNextLife
{
	my $row = shift;
	my $col = shift;
	my $lastLifeRef = shift;
	my $row_max = shift;
	my $col_max = shift;

	my $neighbours = 
	${$lastLifeRef}[$row - 1][$col - 1] + 
	${$lastLifeRef}[$row - 1][$col]     +
	${$lastLifeRef}[$row - 1][($col + 1) % $col_max ] +
	${$lastLifeRef}[$row][$col - 1] +
	${$lastLifeRef}[$row][($col + 1)  % $col_max ] +
	${$lastLifeRef}[($row + 1) % $row_max ][$col - 1] + 
	${$lastLifeRef}[($row + 1) % $row_max ][$col] +
	${$lastLifeRef}[($row + 1) % $row_max ][($col + 1) % $col_max ];

	if ( $neighbours < 2 || $neighbours > 3 )
	{
		return 0;
	}
	elsif ( $neighbours == 3 )
	{
		return 1;
	}
	elsif ( $neighbours == 2 )
	{
		return ${$lastLifeRef}[$row][$col]; 
	}
	else
	{
		return 0;
	}
}

sub showLife
{
	my $lifeRef = shift;
	say `clear`;
	for ( @{$lifeRef} )
	{
		my $rowRef = $_;
		for ( @{$rowRef} )
		{
			my $cell = $_;
			if ( $cell )
			{
				print " X ";
			}
			else
			{
				print "   ";
			}
		}
		print "\n";
	}
}

sub get_random
{
	my $random_row = int( rand(60) );
	my $random_col = int( rand(60) );

	return ( $random_row, $random_col );
}

my $table_r = 60;
my $table_c = 60;
my $num_alive = 1800;
my @alive_cells;

for ( my $ctr = 0; $ctr < $num_alive; $ctr++ )
{
	my ( $rand_row, $rand_col ) = get_random();
	push( @alive_cells, "$rand_row $rand_col" );
}

#create table
my @table;
for ( my $row = 0; $row < $table_r; $row++ )
{
	for ( my $col = 0; $col < $table_c; $col++ )
	{
		if ( "$row $col" ~~ @alive_cells )
		{
			$table[$row][$col] = 1;
		}
		else
		{
			$table[$row][$col] = 0;
		}
	}
}

showLife(\@table);

my $temp = \@table;
while (1)
{
	showLife($temp);
	sleep (0.1);
	$temp = computeNextLife($temp);
}


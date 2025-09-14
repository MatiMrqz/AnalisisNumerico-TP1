## Copyright (C) 2025 Mati Mrqz
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} simpson_multiple (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mati Mrqz <matimrqz@MacBook-Pro-de-Mati.local>
## Created: 2025-09-08

function retval = simpson_multiple (yt, dt)
  N=length(yt)-1;
  ISim = 0;
  for k=2:2:N
    ISim = ISim + dt*(yt(k-1)+4*yt(k)+yt(k+1))/3;
  endfor
  retval=ISim;
endfunction

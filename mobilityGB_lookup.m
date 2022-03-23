function [GBmobility_reduced] = mobilityGB_lookup(const,GB_length,theta)
%mobilityGB_lookup Returns the grain boundary mobility in units of m^3/J/s
%based on the temperature and grain boundary length
%theta = misorientation of grain boundary

% Arrhenius prefactor that is dependent on the misorientation in degrees
Mo = -8.710215E-08*theta.^6 + 1.824603E-05*theta.^5 - 1.509285E-03*theta.^4 + 6.240242E-02*theta.^3 -...
    1.340587E+00*theta.^2 + 1.390459E+01*theta;

% Temperature dependent GB mobility in m^3/J/s
GBmobility = Mo .* exp(-const.mobilityGB_Q / (8.314*10^-5*const.Temp));

% Reduce to grain boundary mobility with respect to the boundary length
GBmobility_reduced = GBmobility/GB_length;

end


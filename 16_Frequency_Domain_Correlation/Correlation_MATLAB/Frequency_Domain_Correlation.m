a = rand(128,1)';
b = circshift(a',10)';

ab_time_domain_correlation = conv(a,b);

plot(ab_time_domain_correlation)

a_fft = fft([a zeros(1,128)]);
b_fft = fft([b zeros(1,128)]);

Complex_mulriplication = (a_fft .* b_fft);
ab_freq_domain_correlation = (ifft(Complex_mulriplication));

hold
plot(ab_freq_domain_correlation,'r')

%%
a = rand(128,1)';
b = circshift(a',10)';

a_fft = fft(a);
b_fft = fft(b);

Complex_mulriplication = (a_fft .* conj(b_fft));
ab_freq_domain_correlation = real(ifft(Complex_mulriplication));

figure
plot(ab_freq_domain_correlation)
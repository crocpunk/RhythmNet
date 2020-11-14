extends Node

func aLerp(amount, time, actual): # given an amount and the time that amount will be interpolated in, generates a number from any given time
	if (time == 0):
		return 0
	return 1 - pow(1 - amount, actual/time)

func pmod(num, mod):
	if (num < 0):
		num = num + ceil(abs(num/mod)) * mod
	return fmod(num, mod)

func getRandomInt(max_value):
	randomize()
	
	return randi() % max_value

func randomBytes(n):
	var r = []
	
	for index in range(0, n):
		r.append(getRandomInt(256))
	
	return r

func uuidbin():
	var b = randomBytes(16)
	
	b[6] = (b[6] & 0x0f) | 0x40
	b[8] = (b[8] & 0x3f) | 0x80
	return b

func uuid():
	randomize()
	var b = uuidbin()
	
	var low = '%02x%02x%02x%02x' % [b[0], b[1], b[2], b[3]]
	var mid = '%02x%02x' % [b[4], b[5]]
	var hi = '%02x%02x' % [b[6], b[7]]
	var clock = '%02x%02x' % [b[8], b[9]]
	var node = '%02x%02x%02x%02x%02x%02x' % [b[10], b[11], b[12], b[13], b[14], b[15]]
	
	return '%s-%s-%s-%s-%s' % [low, mid, hi, clock, node]

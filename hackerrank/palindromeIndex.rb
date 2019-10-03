
def palindrome?(a, i = 0, j = a.length-1)
	loop do
		break if i>=j
		return false if a[i] != a[j]
		i += 1
		j -= 1
	end
	return true
end

def palindromeIndex(s)
	a = s.split('')
	i = 0
	j = a.length-1
	index = nil
	loop do
		break if i >= j
		if a[i] != a[j] 
			return -1 if index
			if palindrome?(a, i, j-1)
				index = j
				i -= 1
			elsif palindrome?(a, i+1, j)
				index = i
				j += 1
			else
				return -1
			end
		end
		i += 1
		j -= 1
	end
	index ? index : -1
end



p palindromeIndex('quyjjdcgsvvsgcdjjyq')
p palindromeIndex('hgygsvlfwcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcflvsgygh')
p palindromeIndex('fgnfnidynhxebxxxfmxixhsruldhsaobhlcggchboashdlurshxixmfxxxbexhnydinfngf')
p palindromeIndex('bsyhvwfuesumsehmytqioswvpcbxyolapfywdxeacyuruybhbwxjmrrmjxwbhbyuruycaexdwyfpaloyxbcpwsoiqtymhesmuseufwvhysb')
p palindromeIndex('fvyqxqxynewuebtcuqdwyetyqqisappmunmnldmkttkmdlnmnumppasiqyteywdquctbeuwenyxqxqyvf')
p palindromeIndex('mmbiefhflbeckaecprwfgmqlydfroxrblulpasumubqhhbvlqpixvvxipqlvbhqbumusaplulbrxorfdylqmgfwrpceakceblfhfeibmm')
p palindromeIndex('tpqknkmbgasitnwqrqasvolmevkasccsakvemlosaqrqwntisagbmknkqpt')
p palindromeIndex('lhrxvssvxrhl')
p palindromeIndex('prcoitfiptvcxrvoalqmfpnqyhrubxspplrftomfehbbhefmotfrlppsxburhyqnpfmqlaorxcvtpiftiocrp')
p palindromeIndex('kjowoemiduaaxasnqghxbxkiccikxbxhgqnsaxaaudimeowojk')

#'wcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwc'
#hgygsvlf flvsgygh

# 1
# 8
# 33
# 23
# 25
# 44
# 20
# -1
# 14
# -1
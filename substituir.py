import sys

def remove(l,c):
  for word in c:
      while word in l:
          l.remove(word)

bfile = open('WordList.txt','r')
dfile = open(sys.argv[1],'r')
cfile = open('comt','r')
out = open('out_'+sys.argv[1],'w')

clist = cfile.readlines()
blist = bfile.readlines()
dlist = dfile.readlines()

number = int(dlist[0])
dsf = []

blist = list(map(str.strip, blist))
clist = list(map(str.strip, clist))

for line in dlist[1:]:
    newline = line.split()
    remove(newline,clist)
    dsf.append(newline)

out.write(str(number)+"\n")
for x in range(len(dsf)):
    newline = []
    index = 0
    for word in range(len(dsf[x])):
        try:
            newline.append(blist.index(dsf[x][word]))
        except: 
            pass
    out.write("%s\n" % ' '.join(str(y) for y in newline))

bfile.close  
dfile.close
out.close



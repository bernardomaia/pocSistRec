import sys

def remove(l,c):
  for word in c:
      while word in l:
          l.remove(word)

bfile = open('WordList.txt','r')
dfile = open('data.txt','r')
cfile = open('comt','r')
out = open('BagOfSentences.txt','w')

clist = cfile.readlines()
blist = bfile.readlines()
dlist = dfile.readlines()

number = int(sys.argv[1])


dsf = []

blist = map(str.strip, blist)
clist = map(str.strip, clist)

for line in dlist[0:number]:
    newline = line.split()
    remove(newline,clist)
    dsf.append(newline)

out.write("%s\n" % sys.argv[1])
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



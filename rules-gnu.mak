# common rules
#
# to be included at the end of each makefile

makedirs:
	-@mkdir $(OUTDIR)

$(OUTDIR)/%.o: $(SOURCEDIR)/%.c
	$(CC) $(CFLAGS) -o $(OUTDIR)/$@ -c $< 

{$(SOURCEDIR)}.cpp{$(OUTDIR)}.o::
	$(CC) $(CFLAGS) -o $(OUTDIR)/$@ -c $< 

{$(OUTDIR)}.c{$(OUTDIR)}.obj::
	$(CC) $(CFLAGS) -o $(OUTDIR)/$< -I$(SOURCEDIR) -c $< 

{$(SOURCEDIR)}.rc{$(OUTDIR)}.res:
	$(RC) /fo $@ /i$(SOURCEDIR) $**

clean :
	@$(RM) $(OUTDIR)/*
	@$(RMDIR) $(OUTDIR)

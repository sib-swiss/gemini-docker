FROM python:2.7

# Download Gemini install script
RUN wget https://raw.github.com/arq5x/gemini/master/gemini/scripts/gemini_install.py

# Create the default data dir
RUN mkdir -p /usr/local/share/gemini

# Install Gemini, without biological databases
RUN python gemini_install.py --nodata /usr/local /usr/local/share/gemini

# Make it executable
ENV PATH="/usr/local/bin/gemini:$PATH"

# When the container is run, execute "gemini"
ENTRYPOINT ["gemini"]

# If no argument is specified, show help
CMD ["-h"]

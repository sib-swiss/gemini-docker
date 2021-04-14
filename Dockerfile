FROM python:2.7

# Download Gemini install script
RUN wget https://raw.github.com/arq5x/gemini/master/gemini/scripts/gemini_install.py

# Create the data dir
RUN mkdir -p /usr/local/share/gemini/gemini_data

# Install Gemini, without annotation data
RUN python gemini_install.py --nodata /usr/local /usr/local/share/gemini

# Make it executable
ENV PATH="/usr/local/bin/gemini:$PATH"

# Install a few utils for debugging
RUN apt-get update
RUN apt-get install -y vim

# When the container is run, execute "gemini"
ENTRYPOINT ["gemini"]

# If no argument is specified, show help
CMD ["-h"]

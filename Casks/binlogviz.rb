cask "binlogviz" do
  version "0.10.0"

  on_macos do
    on_intel do
      sha256 "cd16a7b936c5722985391abe4a0201484aa98c37a1c9fea6c4b0f1698b6cd8c3"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.10.0/binlogviz_0.10.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "6b6f35450c7692651d9feb5faa88217f447b7c10a7085614bf598fca7e802273"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.10.0/binlogviz_0.10.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "bb17a54703396f83e468e358c820dbb519ae055bf051b4e061c42e79e4062650"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.10.0/binlogviz_0.10.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "8aaaf21bc7becd1f8b4079400643842d095796f574e773392e64ef978fdffc72"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.10.0/binlogviz_0.10.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end

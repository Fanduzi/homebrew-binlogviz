cask "binlogviz" do
  version "0.23.19"

  on_macos do
    on_intel do
      sha256 "dd2fdacb383173581aa18314a8532d1543a0cfead252310cc63a38b8a69eec65"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.19/binlogviz_0.23.19_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "c8c1071214a640412435be6264cd5d2cca61be0a934017f77f1db26b3775bf9f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.19/binlogviz_0.23.19_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "07bb868948ce9b47235fb1be8ed5a20995c3ebd3cc961a92b627a000f2742f7c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.19/binlogviz_0.23.19_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "001e917564b4b05077843d12b585c307a24208d8fbbba8dbf5d0a35e5d9a6c49"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.19/binlogviz_0.23.19_linux_arm64.tar.gz",
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

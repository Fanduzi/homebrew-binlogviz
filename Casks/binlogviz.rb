cask "binlogviz" do
  version "0.23.30"

  on_macos do
    on_intel do
      sha256 "40c4fac8ccf2f45db9861bd142638b4bc64b0001d7be69e79c8344416614ddbc"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.30/binlogviz_0.23.30_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "2bf8814a33be328527c019fc44e4c55bcedbbd0214209da7602f90a0942ac9e1"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.30/binlogviz_0.23.30_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "a1af965c1d0048d313e30c1424c04ddec4aba0bd9c417cb708141da6464f04cb"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.30/binlogviz_0.23.30_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "c134773c1f5e3c6845716af675026c8d378d6bccb50b73f08322dfa19d22ab13"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.30/binlogviz_0.23.30_linux_arm64.tar.gz",
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

cask "binlogviz" do
  version "0.40.0"

  on_macos do
    on_intel do
      sha256 "19627d3b8cc93f39ada6c7a9f53c1619177d27b6aa5db19c210dbf36eb743c6f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.40.0/binlogviz_0.40.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "a2d691c2549cf05a8fc233e06acbd1b507bf7943565d638d474941d33385bbca"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.40.0/binlogviz_0.40.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "bb7d0965501acd94b1138bf8c239e96f26d3c5bbea1bbd060091c9cef95d4fcf"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.40.0/binlogviz_0.40.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "53dfd59f2974e4356731d4ff26e689508de5340b4c9bf31baa047f141a499639"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.40.0/binlogviz_0.40.0_linux_arm64.tar.gz",
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

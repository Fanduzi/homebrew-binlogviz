cask "binlogviz" do
  version "0.13.0"

  on_macos do
    on_intel do
      sha256 "98190b51586f8d368e1f542df0ee4f5736d02d0903a2098565507ee976356eb3"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.13.0/binlogviz_0.13.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "fdbb60a6e2d76f16d1344595012a2238c0b1fa6f92eb84986b24846dcee5bae2"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.13.0/binlogviz_0.13.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "57a8f63dee5aff30f426f62ded43367ffb9703efa44369036bca538ec4d5df78"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.13.0/binlogviz_0.13.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "eb5420c880708b5810dbc59e689cfbf3eaf79d3c039eba91ed19bab0fe1579cd"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.13.0/binlogviz_0.13.0_linux_arm64.tar.gz",
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

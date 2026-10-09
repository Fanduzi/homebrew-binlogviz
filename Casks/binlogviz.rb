cask "binlogviz" do
  version "0.23.24"

  on_macos do
    on_intel do
      sha256 "8fe364abb7985a2c902ec068473422fc4b0825e779e4bf1554b5b2be5915fb2e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.24/binlogviz_0.23.24_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "8752e81e89dbb5f83774745b9f6d232c03dfbede110732d28999f1c1ce47a480"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.24/binlogviz_0.23.24_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "d0c1078a0cc13a6af292622767c1819e7dd4be957a3d9647c7a84839460bb8c2"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.24/binlogviz_0.23.24_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "5eb609a43cbda821d59a914eacc6de63f071a043e66686103de1fd6efb35ad5b"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.24/binlogviz_0.23.24_linux_arm64.tar.gz",
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

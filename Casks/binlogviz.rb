cask "binlogviz" do
  version "0.23.12"

  on_macos do
    on_intel do
      sha256 "9f9989ea31742d2ed0350f0212c73a38050982e24da3ccc7abc3ff7142694702"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.12/binlogviz_0.23.12_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "fb7c0a11b4c678d1f4984a7b5c753da2ba7dcb296dfa954c0ed37e258b5109a4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.12/binlogviz_0.23.12_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "e2b033e51644ced527399b53af6bff25db7459dc2dbf8fa2dbcea2e995cd4640"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.12/binlogviz_0.23.12_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "effd70bd985489c502e2d27d4a54461cd3e2a0e87478a0e4fb763fab4f7aa681"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.12/binlogviz_0.23.12_linux_arm64.tar.gz",
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
